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

require_once (TEMPLATEPATH . '/framework/theme-files.php');
$theme = new wt_themeFiles();
$theme->wt_init(array(
    'theme_name' => 'WhoaThemes', 
    'theme_slug' => 'whoathemes'
));
