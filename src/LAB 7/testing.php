// PRODUCTION READY: Create Billplz bill on Forminator submit and redirect user to Billplz
// Add this as a "Run snippet everywhere" snippet in Code Snippets

// Logging function - logs errors and important events only
function billplz_log($message, $level = 'info') {
    // Only log errors and critical events in production
    if ($level === 'error' || $level === 'critical') {
        $log_file = WP_CONTENT_DIR . '/billplz-errors.log';
        $timestamp = date('Y-m-d H:i:s');
        $log_message = "[{$timestamp}] [{$level}] {$message}\n";
        file_put_contents($log_file, $log_message, FILE_APPEND);
        error_log("[Billplz {$level}] {$message}");
    }
}

// Hook into form submission - try multiple hooks to ensure we catch it
add_action( 'wp_ajax_forminator_submit_form_custom-forms', 'billplz_intercept_form_submit', 1 );
add_action( 'wp_ajax_nopriv_forminator_submit_form_custom-forms', 'billplz_intercept_form_submit', 1 );

function billplz_intercept_form_submit() {
    // Check if this is our target form
    $form_id = isset($_POST['form_id']) ? intval($_POST['form_id']) : 0;
    
    if ($form_id !== 4596) {
        return; // Let Forminator handle other forms
    }
    
    // Create bill and get URL
    $entry = new stdClass();
    $bill_url = billplz_create_bill_and_get_url($entry, $form_id);
    
    if (!empty($bill_url)) {
        // Send JSON response telling Forminator to redirect
        wp_send_json_success(array(
            'success' => true,
            'message' => 'Redirecting to payment...',
            'url' => $bill_url,
            'redirect' => $bill_url,
            'behavior' => 'redirect'
        ));
    } else {
        billplz_log('Failed to create Billplz bill for form ' . $form_id, 'error');
        wp_send_json_error(array(
            'message' => 'Payment setup failed. Please try again or contact support.'
        ));
    }
}

// Backup filter hook in case AJAX hook doesn't fire
add_filter( 'forminator_custom_form_submit_response', function( $response, $form_id, $entry ) {
    if ($form_id !== 4596) {
        return $response;
    }
    
    $bill_url = billplz_create_bill_and_get_url($entry, $form_id);
    
    if (!empty($bill_url)) {
        $response['success'] = true;
        $response['message'] = 'Redirecting to payment...';
        $response['url'] = $bill_url;
        $response['redirect'] = $bill_url;
        $response['behavior'] = 'redirect';
    }
    
    return $response;
}, 999, 3 );

// Main Billplz creation function
function billplz_create_bill_and_get_url($entry, $form_id) {
    // ========== PRODUCTION CONFIG - UPDATE THESE VALUES ==========
    $TARGET_FORM_ID         = 4596;    // Your Forminator form ID
    $FIELD_SLUG_REGID       = 'name-2';  // Registration ID field
    $FIELD_SLUG_NAME        = 'name-1';  // Full name field
    $FIELD_SLUG_EMAIL       = 'email-1'; // Email field
    $FIELD_SLUG_PHONE       = 'phone-1'; // Phone field
    $FIELD_SLUG_CATEGORY    = 'radio-1'; // Category/participant type field
    
    // !!! CHANGE THESE TO YOUR PRODUCTION VALUES !!!
    $BILLPLZ_SECRET_KEY     = 'YOUR_PRODUCTION_SECRET_KEY_HERE';  // Get from Billplz dashboard
    $COLLECTION_ID          = 'YOUR_PRODUCTION_COLLECTION_ID';    // Get from Billplz dashboard
    $ADMIN_NOTIFICATION_TO  = 'your-email@mapps.org.my';         // Your admin email
    
    $REDIRECT_URL_BASE      = home_url('/payment-success');
    $REDIRECT_URL_FAILED    = home_url('/payment-failed');
    $CALLBACK_ENDPOINT      = home_url('/wp-json/billplz/v1/callback');
    // ========== END CONFIG ==========

    // Only run for the target form
    if ( intval( $form_id ) !== intval( $TARGET_FORM_ID ) ) {
        return null;
    }

    // Extract field values from POST data
    $reg_id    = isset($_POST[$FIELD_SLUG_REGID]) ? sanitize_text_field($_POST[$FIELD_SLUG_REGID]) : '';
    $fullname  = isset($_POST[$FIELD_SLUG_NAME]) ? sanitize_text_field($_POST[$FIELD_SLUG_NAME]) : '';
    $email     = isset($_POST[$FIELD_SLUG_EMAIL]) ? sanitize_email($_POST[$FIELD_SLUG_EMAIL]) : '';
    $mobile    = isset($_POST[$FIELD_SLUG_PHONE]) ? sanitize_text_field($_POST[$FIELD_SLUG_PHONE]) : '';
    $category  = isset($_POST[$FIELD_SLUG_CATEGORY]) ? sanitize_text_field($_POST[$FIELD_SLUG_CATEGORY]) : '';
    
    // Check for duplicate registration ID
    $existing_bills = get_option('billplz_registration_ids', array());
    if (in_array($reg_id, $existing_bills)) {
        billplz_log("Duplicate registration ID attempted: {$reg_id}", 'error');
        return null; // Prevent duplicate registrations
    }
    
    // Calculate amount based on category - UPDATE THESE TO MATCH YOUR ACTUAL PRICES
    $amount = 0;
    if ($category === 'Local-Participant') {
        $amount = 1000; // RM 150 for Local Participant
    } elseif ($category === 'International-Participant') {
        $amount = 1200; // RM 200 for International Participant
    } elseif ($category === 'Student-(Local)') {
        $amount = 650; // RM 100 for Student (Local)
    } elseif ($category === 'Student-(International)') {
        $amount = 800; // RM 120 for Student (International)
    } elseif ($category === 'MAPPS-Member') {
        $amount = 850; // RM 80 for MAPPS Member
    } elseif ($category === 'Associates-Members-(min-3-person)') {
        $amount = 850; // RM 70 per person for Associates Members
    }

    // Validation
    if ( empty($reg_id) || empty($fullname) || empty($email) || $amount <= 0 ) {
        billplz_log("Validation failed for registration: {$reg_id}", 'error');
        return null;
    }

    // Billplz expects amount in sen (cents)
    $amount_cents = intval( round( $amount * 100 ) );

    // Build payload for Billplz API
    $payload = array(
        'collection_id'     => $COLLECTION_ID,
        'email'             => $email,
        'mobile'            => $mobile,  // Add mobile number
        'name'              => $fullname . ' [' . $reg_id . ']',  // Add Registration ID to name for visibility
        'amount'            => $amount_cents,
        'callback_url'      => $CALLBACK_ENDPOINT,
        'redirect_url'      => add_query_arg( 
            array(
                'billplz_from' => 'form', 
                'regid' => rawurlencode($reg_id)
            ), 
            $REDIRECT_URL_BASE 
        ),
        'redirect_url_failed' => add_query_arg(
            array(
                'billplz_from' => 'form',
                'regid' => rawurlencode($reg_id),
                'status' => 'failed'
            ),
            $REDIRECT_URL_FAILED
        ),
        'description'       => 'Conference Registration - ' . $category . ' (' . $reg_id . ')',
        'reference_1_label' => 'Registration ID',
        'reference_1'       => $reg_id,
        'reference_2_label' => 'Category',
        'reference_2'       => $category,
    );

    // !!! PRODUCTION: Using LIVE Billplz API !!!
    $response_api = wp_remote_post( 'https://www.billplz.com/api/v3/bills', array(
        'method'      => 'POST',
        'timeout'     => 30,
        'headers'     => array(
            'Authorization' => 'Basic ' . base64_encode( $BILLPLZ_SECRET_KEY . ':' ),
        ),
        'body'        => $payload
    ) );

    if ( is_wp_error( $response_api ) ) {
        billplz_log('Billplz API error for ' . $reg_id . ': ' . $response_api->get_error_message(), 'error');
        return null;
    }

    $http_code = wp_remote_retrieve_response_code( $response_api );
    $body = wp_remote_retrieve_body( $response_api );
    $json = json_decode( $body, true );

    if ( empty( $json ) || ! isset( $json['id'] ) || ! isset( $json['url'] ) ) {
        billplz_log("Billplz unexpected response for {$reg_id}. HTTP: {$http_code}", 'error');
        return null;
    }

    $bill_id  = sanitize_text_field( $json['id'] );
    $bill_url = esc_url_raw( $json['url'] );

    // Save bill mapping
    $map = array(
        'form_id'   => intval( $form_id ),
        'reg_id'    => $reg_id,
        'email'     => $email,
        'mobile'    => $mobile,
        'name'      => $fullname,
        'category'  => $category,
        'amount'    => $amount,
        'bill_id'   => $bill_id,
        'bill_url'  => $bill_url,
        'created'   => current_time('mysql'),
        'status'    => 'pending'
    );
    update_option( 'billplz_bill_to_entry_' . $bill_id, $map, false );
    
    // Track registration ID to prevent duplicates
    $existing_bills[] = $reg_id;
    update_option('billplz_registration_ids', $existing_bills, false);

    return $bill_url;
}


    billplz_log("✅ Validation passed - all required fields present");

    // Billplz expects amount in sen (cents)
    $amount_cents = intval( round( $amount * 100 ) );
    billplz_log("Amount converted to sen: " . $amount_cents . " (RM " . $amount . ")");

    // Build payload for Billplz API
    $payload = array(
        'collection_id'     => $COLLECTION_ID,
        'email'             => $email,
        'name'              => $fullname,
        'amount'            => $amount_cents,
        'callback_url'      => $CALLBACK_ENDPOINT,
        'redirect_url'      => add_query_arg( 
            array(
                'billplz_from' => 'form', 
                'regid' => rawurlencode($reg_id)
            ), 
            $REDIRECT_URL_BASE 
        ),
        'description'       => 'Conference Registration - ' . $category . ' (' . $reg_id . ')',
        'reference_1_label' => 'Registration ID',
        'reference_1'       => $reg_id,
        'reference_2_label' => 'Category',
        'reference_2'       => $category,
    );

    billplz_log("---------- BILLPLZ API REQUEST ----------");
    billplz_log("Collection ID: " . $COLLECTION_ID);
    billplz_log("Callback URL: " . $CALLBACK_ENDPOINT);
    billplz_log("Redirect URL: " . $payload['redirect_url']);
    billplz_log("Full payload: " . print_r($payload, true));

    // POST to Billplz API (SANDBOX)
    $url = 'https://www.billplz-sandbox.com/api/v3/bills';
    billplz_log("Posting to: " . $url);

    $response_api = wp_remote_post( $url, array(
        'method'      => 'POST',
        'timeout'     => 30,
        'headers'     => array(
            'Authorization' => 'Basic ' . base64_encode( $BILLPLZ_SECRET_KEY . ':' ),
        ),
        'body'        => $payload
    ) );

    if ( is_wp_error( $response_api ) ) {
        billplz_log("---------- ❌ WP_ERROR OCCURRED ----------");
        $error_msg = 'Error creating Billplz bill: ' . $response_api->get_error_message();
        billplz_log( $error_msg );
        wp_mail( $ADMIN_NOTIFICATION_TO, 'Billplz Creation Error', $error_msg );
        return $response;
    }

    $http_code = wp_remote_retrieve_response_code( $response_api );
    $body = wp_remote_retrieve_body( $response_api );
    
    billplz_log("---------- BILLPLZ API RESPONSE ----------");
    billplz_log("HTTP Status Code: " . $http_code);
    billplz_log("Response Body: " . $body);

    $json = json_decode( $body, true );

    if ( empty( $json ) || ! isset( $json['id'] ) || ! isset( $json['url'] ) ) {
        billplz_log("---------- ❌ UNEXPECTED RESPONSE ----------");
        billplz_log("JSON decode result: " . print_r($json, true));
        billplz_log("Missing 'id': " . (isset($json['id']) ? 'NO' : 'YES'));
        billplz_log("Missing 'url': " . (isset($json['url']) ? 'NO' : 'YES'));
        
        $error_msg = "Billplz returned unexpected response. HTTP: $http_code, Body: $body";
        billplz_log( $error_msg );
        wp_mail( $ADMIN_NOTIFICATION_TO, 'Billplz Creation Error - Unexpected Response', $error_msg );
        return $response;
    }

    $bill_id  = sanitize_text_field( $json['id'] );
    $bill_url = esc_url_raw( $json['url'] );

    billplz_log("---------- ✅ BILL CREATED SUCCESSFULLY ----------");
    billplz_log("Bill ID: " . $bill_id);
    billplz_log("Bill URL: " . $bill_url);
    billplz_log("State: " . (isset($json['state']) ? $json['state'] : 'N/A'));

    // Save a mapping in WP options for later verification by webhook / success-page
    $map = array(
        'form_id'   => intval( $form_id ),
        'reg_id'    => $reg_id,
        'email'     => $email,
        'name'      => $fullname,
        'category'  => $category,
        'amount'    => $amount,
        'bill_id'   => $bill_id,
        'bill_url'  => $bill_url,
        'created'   => current_time('mysql'),
        'status'    => 'pending'
    );

    update_option( 'billplz_bill_to_entry_' . $bill_id, $map, false );
    billplz_log("Mapping saved to wp_options: billplz_bill_to_entry_" . $bill_id);

    // CRITICAL: Modify response to redirect user to Billplz payment page
    if ( ! empty( $bill_url ) ) {
        billplz_log("---------- 🚀 REDIRECTING USER ----------");
        billplz_log("Redirect destination: " . $bill_url);
        
        // Override the Forminator response to trigger redirect
        $response['success'] = true;
        $response['message'] = '<script>window.location.href="' . esc_js($bill_url) . '";</script>';
        $response['url'] = $bill_url;  // Forminator will redirect to this URL
        $response['redirect'] = $bill_url;  // Alternative key
        $response['behavior'] = 'redirect';  // Tell Forminator to redirect
        
        billplz_log("Response modified with redirect URL");
        billplz_log("Final response: " . print_r($response, true));
        return $response;
    }

    billplz_log("---------- ⚠️ WARNING: No redirect ----------");
    billplz_log("Bill URL is empty - cannot redirect user");
    return $response;
}, 999, 3 );  // Changed priority from 10 to 999 to run LAST
*/

// SNIPPET B: Register REST endpoint to receive Billplz callback and verify X-Signature
add_action( 'rest_api_init', function () {
    register_rest_route( 'billplz/v1', '/callback', array(
        'methods'  => 'POST',
        'callback' => 'handle_billplz_callback',
        'permission_callback' => '__return_true',
    ) );
} );

function handle_billplz_callback( WP_REST_Request $request ) {
    // !!! CHANGE THIS TO YOUR PRODUCTION X-SIGNATURE KEY !!!
    $X_SIGNATURE_KEY = 'YOUR_PRODUCTION_X_SIGNATURE_KEY_HERE'; // Get from Billplz dashboard

    // Read raw body
    $raw_body = $request->get_body();

    // Billplz usually sends signature in header 'X-Signature' or 'X-Billplz-Signature'
    $headers = $request->get_headers();
    $signature_header = '';
    if ( isset( $headers['x-signature'][0] ) ) {
        $signature_header = $headers['x-signature'][0];
    } elseif ( isset( $headers['x-billplz-signature'][0] ) ) {
        $signature_header = $headers['x-billplz-signature'][0];
    } elseif ( isset( $_SERVER['HTTP_X_SIGNATURE'] ) ) {
        $signature_header = $_SERVER['HTTP_X_SIGNATURE'];
    }

    // Verify signature (HMAC-SHA256). If Billplz uses a different method you may need to adapt.
    if ( empty($signature_header) ) {
        return new WP_REST_Response( array('error' => 'Missing signature header'), 400 );
    }

    $computed = hash_hmac( 'sha256', $raw_body, $X_SIGNATURE_KEY );
    if ( ! hash_equals( $computed, $signature_header ) ) {
        // Signature mismatch
        return new WP_REST_Response( array('error' => 'Invalid signature'), 403 );
    }

    // decode json payload
    $data = json_decode( $raw_body, true );
    if ( ! is_array( $data ) ) {
        return new WP_REST_Response( array('error' => 'Invalid payload'), 400 );
    }

    // Billplz sends 'id' and 'paid' (paid boolean) in payload; adjust if different
    $bill_id = isset( $data['id'] ) ? sanitize_text_field( $data['id'] ) : '';
    $paid    = isset( $data['paid'] ) ? (bool) $data['paid'] : false;

    if ( empty( $bill_id ) ) {
        return new WP_REST_Response( array('error' => 'Missing bill id'), 400 );
    }

    // Load our saved mapping
    $opt_name = 'billplz_bill_to_entry_' . $bill_id;
    $map = get_option( $opt_name, false );

    if ( ! $map ) {
        // Not found — return ok so Billplz doesn't retry forever, but also log
        error_log("Billplz callback received for unknown bill: " . $bill_id);
        return new WP_REST_Response( array('status' => 'unknown_bill'), 200 );
    }

    // Update status and save back
    $map['status'] = $paid ? 'paid' : 'due';
    $map['paid_at'] = $paid ? current_time('mysql') : null;
    update_option( $opt_name, $map );

    // Notify admin (optional)
    $admin_to = get_option('admin_email');
    $subject = "Billplz callback: Bill {$bill_id} status updated";
    $message = "Bill ID: {$bill_id}\nStatus: " . $map['status'] . "\nRegistration ID: " . $map['reg_id'] . "\nName: " . $map['name'] . "\n";
    wp_mail( $admin_to, $subject, $message );

    return new WP_REST_Response( array('status' => 'ok'), 200 );
}

// SNIPPET C: When user returns to /payment-success or /payment-failed
add_action( 'template_redirect', function() {

    // Check if we're on payment success or failed page
    $is_success_page = is_page( 'payment-success' );
    $is_failed_page = is_page( 'payment-failed' );
    
    if ( ! $is_success_page && ! $is_failed_page ) return;

    // Look for bill id in query — Billplz sometimes returns nested array billplz[id]
    $bill_id = '';
    if ( isset( $_GET['billplz'] ) && is_array( $_GET['billplz'] ) && isset( $_GET['billplz']['id'] ) ) {
        $bill_id = sanitize_text_field( $_GET['billplz']['id'] );
    }
    if ( empty( $bill_id ) && isset( $_GET['id'] ) ) {
        $bill_id = sanitize_text_field( $_GET['id'] );
    }
    // Also check 'bill_id' or 'bill' just in case
    if ( empty( $bill_id ) && isset( $_GET['bill_id'] ) ) {
        $bill_id = sanitize_text_field( $_GET['bill_id'] );
    }

    if ( empty( $bill_id ) ) {
        // No bill id in query – nothing to verify
        return;
    }

    // Check if payment failed from URL parameter
    $paid_status = null;
    if ( isset( $_GET['billplz'] ) && is_array( $_GET['billplz'] ) && isset( $_GET['billplz']['paid'] ) ) {
        $paid_status = $_GET['billplz']['paid'];
    }
    
    // If we're on success page but payment is false, redirect to failed page
    if ( $is_success_page && $paid_status === 'false' ) {
        $reg_id = isset($_GET['regid']) ? sanitize_text_field($_GET['regid']) : '';
        $redirect_url = add_query_arg(
            array(
                'billplz_from' => 'form',
                'regid' => $reg_id,
                'bill_id' => $bill_id,
                'status' => 'failed'
            ),
            home_url('/payment-failed')
        );
        wp_redirect( $redirect_url );
        exit;
    }

    // !!! MUST MATCH THE SECRET KEY IN CONFIG ABOVE !!!
    $BILLPLZ_SECRET_KEY = 'YOUR_PRODUCTION_SECRET_KEY_HERE'; // Same as above
    $opt_name = 'billplz_bill_to_entry_' . $bill_id;
    $map = get_option( $opt_name, false );

    // Query Billplz to verify payment status (PRODUCTION API)
    $url = 'https://www.billplz.com/api/v3/bills/' . rawurlencode( $bill_id );

    $response = wp_remote_get( $url, array(
        'headers' => array(
            'Authorization' => 'Basic ' . base64_encode( $BILLPLZ_SECRET_KEY . ':' )
        ),
        'timeout' => 20
    ) );

    if ( is_wp_error( $response ) ) {
        // optionally show message or log
        return;
    }

    $body = wp_remote_retrieve_body( $response );
    $json = json_decode( $body, true );

    if ( ! isset( $json['paid'] ) ) return;

    $paid = (bool) $json['paid'];

    if ( $map ) {
        $map['status'] = $paid ? 'paid' : 'due';
        if ( $paid ) $map['paid_at'] = current_time('mysql');
        update_option( $opt_name, $map );
    } else {
        // Create mapping if none
        $map = array(
            'form_id' => null,
            'reg_id'  => isset($json['reference_1']) ? $json['reference_1'] : '',
            'email'   => isset($json['email']) ? $json['email'] : '',
            'name'    => isset($json['name']) ? $json['name'] : '',
            'amount'  => isset($json['amount']) ? intval($json['amount'])/100 : 0,
            'bill_id' => $bill_id,
            'status'  => $paid ? 'paid' : 'due',
            'paid_at' => $paid ? current_time('mysql') : null,
            'created' => current_time('mysql')
        );
        update_option( $opt_name, $map );
    }

    // Optional: send admin mail
    if ( $paid ) {
        $admin_to = get_option('admin_email');
        $subject = "Billplz payment successful: {$bill_id}";
        $message = "Bill ID: {$bill_id}\nStatus: PAID\nRegistration ID: " . ($map['reg_id'] ?? '') . "\nName: " . ($map['name'] ?? '') . "\nAmount: " . ($map['amount'] ?? '') . "\n";
        wp_mail( $admin_to, $subject, $message );
    } elseif ( $is_failed_page ) {
        // Send notification for failed payment
        $admin_to = get_option('admin_email');
        $subject = "Billplz payment failed: {$bill_id}";
        $message = "Bill ID: {$bill_id}\nStatus: FAILED/CANCELLED\nRegistration ID: " . ($map['reg_id'] ?? '') . "\nName: " . ($map['name'] ?? '') . "\nAmount: " . ($map['amount'] ?? '') . "\n";
        wp_mail( $admin_to, $subject, $message );
    }

    // You can also set a transient or cookie to show a thank-you message on the page.
});

