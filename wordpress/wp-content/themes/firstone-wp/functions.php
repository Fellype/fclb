<?php

/**
 * Dequeue the jQuery UI script.
 *
 * Hooked to the wp_print_scripts action, with a late priority (100),
 * so that it is after the script was enqueued.
 */
function wpdocs_dequeue_script() {
   wp_dequeue_script( 'jquery-ui-core' );
}
add_action( 'wp_print_scripts', 'wpdocs_dequeue_script', 100 );

// Visual composer custom elements and settings
if( file_exists( dirname( __FILE__ ) . '/framework/composer/custom_elements.php' ) && function_exists( 'add_shortcode_param' ) ){
    include_once dirname( __FILE__ ) . '/framework/composer/custom_elements.php';
    add_action( 'vc_before_init', 'nfw_vcSetAsTheme' );

    function nfw_vcSetAsTheme(){
        vc_set_as_theme( $disable_updater = true );
    }
}

// Theme options related settings
if( file_exists( dirname( __FILE__ ) . '/framework/theme_options_setup.php' ) ){
    include_once dirname( __FILE__ ) . '/framework/theme_options_setup.php';
}

// Tgm activation plugin
if( file_exists( dirname( __FILE__ ) . '/framework/plugins/required_plugins.php' ) ){
    include_once dirname( __FILE__ ) . '/framework/plugins/required_plugins.php';
}

// Base functions and settings
if( file_exists( dirname( __FILE__ ) . '/framework/framework_setup.php' ) ){
    include_once dirname( __FILE__ ) . '/framework/framework_setup.php';
}

// Ajax functions
if( file_exists( dirname( __FILE__ ) . '/framework/ajax_functions.php' ) ){
    include_once(dirname( __FILE__ ) . '/framework/ajax_functions.php');
}

// Icomoon icons list
if( file_exists( dirname( __FILE__ ) . '/framework/icons_list.php' ) ){
    include_once(dirname( __FILE__ ) . '/framework/icons_list.php');
}
