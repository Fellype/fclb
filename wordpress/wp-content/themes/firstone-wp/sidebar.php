<?php

global $post;

if( is_page() || is_singular( 'portfolio' ) ){
    // Sidebar data for each page
    $thePostID = $post->ID;
    $sidebar_name = get_post_meta( $thePostID, 'nfw_sidebar_source', true );
} else{
    // Sidebar data for the rest of the post types (blog sidebar)
    $page_for_posts = get_option( 'page_for_posts' );
    $sidebar_name = get_post_meta( $page_for_posts, 'nfw_sidebar_source', true );
    if($page_for_posts==0) {
        $sidebar_name='nfw-default-sidebar';
    }
}

if( !empty( $sidebar_name ) ){
    if( function_exists( 'dynamic_sidebar' ) ){
        echo '<div class="nfw-span3">';
        dynamic_sidebar( $sidebar_name );
        echo '</div>';
    }
}