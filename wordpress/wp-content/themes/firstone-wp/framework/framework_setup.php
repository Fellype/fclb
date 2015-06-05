<?php

// Compatiblity
function nfw_compatible_headers( $headers ){
    if( isset( $_SERVER['HTTP_USER_AGENT'] ) &&
            (strpos( $_SERVER['HTTP_USER_AGENT'], 'MSIE' ) !== false) ){
        $headers['X-UA-Compatible'] = 'IE=edge,chrome=1,requiresActiveX=true';
    }
    return $headers;
}

function is_edit_page( $new_edit = null ){
    global $pagenow;
    //make sure we are on the backend
    if( !is_admin() )
        return false;


    if( $new_edit == "edit" )
        return in_array( $pagenow, array('post.php',) );
    elseif( $new_edit == "new" ) //check for new post page
        return in_array( $pagenow, array('post-new.php') );
    else //check for either new or edit
        return in_array( $pagenow, array('post.php', 'post-new.php') );
}

// ENQUEUE SCRIPTS AND STYLES
// CSS and JS for admin panels
function nfw_admin_scripts_and_styles(){
    if( is_admin() ){
        wp_enqueue_media();
        global $typenow;
        global $pagenow;

        if( is_edit_page() && "portfolio" == $typenow || is_edit_page() || $pagenow == "nav-menus.php" ){
            //yes its an edit page  of a custom post type named Post_Type_Name

            wp_register_script( 'nfw-icons-handle', get_template_directory_uri() . '/framework/admin/js/vc_admin_functions.js' );
            wp_enqueue_script( 'nfw-icons-handle' );

            wp_register_script( 'nfw-admin-functions', get_template_directory_uri() . '/framework/admin/js/admin_functions.js' );
            wp_enqueue_script( 'nfw-admin-functions' );

            wp_register_style( 'nfw-font-awesome-admin', get_template_directory_uri() . '/layout/css/fontawesome/font-awesome.min.css' );
            wp_enqueue_style( 'nfw-font-awesome-admin' );

            wp_register_style( 'nfw-admin-styles', get_template_directory_uri() . '/framework/admin/css/admin_styles.css' );
            wp_enqueue_style( 'nfw-admin-styles' );

            wp_register_style( 'nfw-iconfontcustom-css', get_template_directory_uri() . '/layout/css/iconfontcustom/icon-font-custom.css' );
            wp_enqueue_style( 'nfw-iconfontcustom-css' );

            $script_data = array(
                'nfw_default_header' => get_template_directory_uri() . "/framework/admin/images/icons/header-image.png",
            );
            wp_localize_script(
                    'nfw-admin-functions', 'nfw_default_header', $script_data
            );
        }
        wp_enqueue_script( 'wp-link' );
    }
}

add_action( 'admin_enqueue_scripts', 'nfw_admin_scripts_and_styles' );

// CSS and JS files for the site
function nfw_front_styles_scripts(){

    wp_register_style( 'nfw_main_style_css', get_template_directory_uri() . '/style.css' );
    wp_register_style( 'nfw_font_awesome', get_template_directory_uri() . '/layout/css/fontawesome/font-awesome.min.css' );

    wp_enqueue_style( 'nfw_font_awesome' );
    wp_enqueue_style( 'nfw_main_style_css' );

    wp_register_style( 'nfw_base_css', get_template_directory_uri() . '/layout/css/base.css' );
    wp_register_style( 'nfw_grid_css', get_template_directory_uri() . '/layout/css/grid.css' );
    wp_register_style( 'nfw_elements_css', get_template_directory_uri() . '/layout/css/elements.css' );
    wp_register_style( 'nfw_layout_css', get_template_directory_uri() . '/layout/css/layout.css' );
    wp_register_style( 'nfw_iconfontcustom_css', get_template_directory_uri() . '/layout/css/iconfontcustom/icon-font-custom.css' );
    wp_register_style( 'nfw_magnific_popup_css', get_template_directory_uri() . '/layout/js/magnificpopup/magnific-popup.css' );
    wp_register_style( 'nfw_bxslider_css', get_template_directory_uri() . '/layout/js/bxslider/jquery.bxslider.css' );
    wp_register_style( 'nfw_animate_css', get_template_directory_uri() . '/layout/js/animations/animate.min.css' );

    wp_enqueue_style( 'nfw_base_css' );
    wp_enqueue_style( 'nfw_grid_css' );
    wp_enqueue_style( 'nfw_elements_css' );
    wp_enqueue_style( 'nfw_iconfontcustom_css' );
    wp_enqueue_style( 'nfw_layout_css' );
    wp_enqueue_style( 'nfw_magnific_popup_css' );
    wp_enqueue_style( 'nfw_bxslider_css' );
    wp_enqueue_style( 'nfw_animate_css' );

    wp_enqueue_script( 'jquery' );

    // Register scripts   
    // ViewPort
    wp_register_script( 'nfw_viewport_js', get_template_directory_uri() . '/layout/js/viewport/jquery.viewport.js', array('jquery'), false, true );
    wp_enqueue_script( 'nfw_viewport_js' );

    // Easing
    wp_register_script( 'nfw_easing_js', get_template_directory_uri() . '/layout/js/easing/jquery.easing.1.3.js', array('jquery'), false, true );
    wp_enqueue_script( 'nfw_easing_js' );

    // Simpleplaceholder
    wp_register_script( 'nfw_simpleplaceholder_js', get_template_directory_uri() . '/layout/js/simpleplaceholder/jquery.simpleplaceholder.js', array('jquery'), false, true );
    wp_enqueue_script( 'nfw_simpleplaceholder_js' );

    // Fitvids
    wp_register_script( 'nfw_fitvids_js', get_template_directory_uri() . '/layout/js/fitvids/jquery.fitvids.js', array('jquery'), false, true );
    wp_enqueue_script( 'nfw_fitvids_js' );

    // Animate
    wp_register_script( 'nfw_animated_js', get_template_directory_uri() . '/layout/js/animations/animate.js', array('jquery'), false, true );
    wp_enqueue_script( 'nfw_animated_js' );

    // Superfish Menu
    wp_register_script( 'nfw_hoverintent_js', get_template_directory_uri() . '/layout/js/superfish/hoverIntent.js', array('jquery'), false, true );
    wp_register_script( 'nfw_superfish_js', get_template_directory_uri() . '/layout/js/superfish/superfish.js', array('jquery'), false, true );
    wp_enqueue_script( 'nfw_hoverintent_js' );
    wp_enqueue_script( 'nfw_superfish_js' );

    // Bxslider
    wp_register_script( 'nfw_bxslider_js', get_template_directory_uri() . '/layout/js/bxslider/jquery.bxslider.min.js', array('jquery'), false, true );
    wp_enqueue_script( 'nfw_bxslider_js' );

    // Magnific Popup
    wp_register_script( 'nfw_magnific_popup_js', get_template_directory_uri() . '/layout/js/magnificpopup/jquery.magnific-popup.min.js', array('jquery'), false, true );
    wp_enqueue_script( 'nfw_magnific_popup_js' );

    // Scrollspy
    wp_register_script( 'nfw_scrollspy_js', get_template_directory_uri() . '/layout/js/scrollspy/scrollspy.min.js', array('jquery'), false, true );
    wp_enqueue_script( 'nfw_scrollspy_js' );

    // Isotope
    wp_register_script( 'nfw_imagesloaded_js', get_template_directory_uri() . '/layout/js/isotope/imagesloaded.pkgd.min.js', array('jquery'), false, true );
    wp_register_script( 'nfw_isotope_min_js', get_template_directory_uri() . '/layout/js/isotope/isotope.pkgd.min.js', array('jquery'), false, true );
    wp_enqueue_script( 'nfw_imagesloaded_js' );
    wp_enqueue_script( 'nfw_isotope_min_js' );

    // Parallax
    wp_register_script( 'nfw_parallax_js', get_template_directory_uri() . '/layout/js/parallax/jquery.parallax.min.js', array('jquery'), false, true );
    wp_enqueue_script( 'nfw_parallax_js' );

    // EasyPieChart
    wp_register_script( 'nfw_easypiechart_js', get_template_directory_uri() . '/layout/js/easypiechart/jquery.easypiechart.min.js', array('jquery'), false, true );
    wp_enqueue_script( 'nfw_easypiechart_js' );

    // Twitter
    wp_register_script( 'nfw_twitterfetcher_js', get_template_directory_uri() . '/layout/js/twitter/twitterfetcher.js' );
    wp_enqueue_script( 'nfw_twitterfetcher_js' );

    // custom scripts
    wp_register_script( 'nfw_custom_js', get_template_directory_uri() . '/layout/js/custom.js', array('jquery'), false, true );
    wp_enqueue_script( 'nfw_custom_js' );

    // scripts for ajax calls
    wp_register_script( 'ajax_calls_script', get_template_directory_uri() . '/layout/js/ajax_calls.js', array('jquery'), false, true );
    wp_localize_script( 'ajax_calls_script', 'nfw_ajax', array('ajaxurl' => admin_url( 'admin-ajax.php' )) );
    wp_enqueue_script( 'ajax_calls_script' );

    if( is_singular() && comments_open() && get_option( 'thread_comments' ) ){
        wp_enqueue_script( 'comment-reply' );
    }

    // Google Fonts
    wp_register_style( 'nfw_googleFonts_OpenSans', 'http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700' );
    wp_enqueue_style( 'nfw_googleFonts_OpenSans' );
    wp_register_style( 'nfw_googleFonts_Montserrat', 'http://fonts.googleapis.com/css?family=Montserrat:400,700' );
    wp_enqueue_style( 'nfw_googleFonts_Montserrat' );
    wp_register_style( 'nfw_googleFonts_Volkhov', 'http://fonts.googleapis.com/css?family=Volkhov' );
    wp_enqueue_style( 'nfw_googleFonts_Volkhov' );

    global $nfw_theme_options;

    if( isset( $nfw_theme_options['nfw-header-logo'] ) ){
        $logo_header_link = esc_url( $nfw_theme_options['nfw-header-logo']['url'] );
    } else{
        $logo_header_link = get_template_directory_uri() . '/layout/images/logo.png';
    }

    if( isset( $nfw_theme_options['nfw-header-sticky-logo'] ) ){
        $logo_sticky_link = esc_url( $nfw_theme_options['nfw-header-sticky-logo']['url'] );
    } else{
        $logo_sticky_link = get_template_directory_uri() . '/layout/images/logo-dark.png';
    }

    $script_link = array(
        'logo-header-link' => $logo_header_link,
        'logo-sticky-link' => $logo_sticky_link,
        'map-marker' => get_template_directory_uri() . '/layout/images/map-marker.png',
    );

    wp_localize_script(
            'nfw_custom_js', 'nfw_links', $script_link
    );
    
}

if( !is_admin() ){
    add_action( 'wp_enqueue_scripts', 'nfw_front_styles_scripts' );
}

// Set up the content width value based on the theme's design.
if( !isset( $content_width ) ){
    $content_width = 1170;
}

function nfw_add_editor_styles() {
    add_editor_style( '/layout/css/elements.css' );
}
add_action( 'admin_init', 'nfw_add_editor_styles' );

if( !function_exists( 'nfw_setup' ) ){

    function nfw_setup(){

        // translation file
        // Localization Support
        load_theme_textdomain( 'firstone_domain', get_template_directory() . '/languages' );

        $locale = get_locale();
        $locale_file = get_template_directory() . "/languages/$locale.php";
        if( is_readable( $locale_file ) ){
            require_once($locale_file);
        }
        // Add RSS feed links to <head> for posts and comments.
        add_theme_support( 'automatic-feed-links' );

        add_theme_support( 'title-tag' );
        // Enable support for Post Thumbnails...
        add_theme_support( 'post-thumbnails' );
        set_post_thumbnail_size( 1170, 999999 );

        // Crops the uploaded images to certain sizes used for different components and elements
        if( function_exists( 'add_image_size' ) ){
            add_image_size( 'nfw_image_70_70', 70, 70, true );
            add_image_size( 'nfw_image_400_400', 400, 400, true );
            add_image_size( 'nfw_image_270_270', 270, 270, true );
            add_image_size( 'nfw_image_570_680', 570, 680, true );
            add_image_size( 'nfw_image_860_540', 860, 540, true );
        }

        add_theme_support( 'menus' );
        register_nav_menu( 'nfw-firstone-menu', __( 'FirstOne Menu', 'firstone_domain' ) );

        /*
         * Switch default core markup for search form, comment form, and comments
         * to output valid HTML5.
         */
        add_theme_support( 'html5', array(
            'search-form', 'comment-form', 'comment-list', 'gallery', 'caption'
        ) );

        // Allows to link a custom stylesheet file to the TinyMCE visual editor
        add_editor_style( get_template_directory_uri() . '/layout/css/elements.css' );

        // disables frontend editor of visual composer
        if( function_exists( 'vc_disable_frontend' ) ){
            vc_disable_frontend();
        }

        // Add support for featured content.
        add_theme_support( 'featured-content', array(
            'featured_content_filter' => 'nfw_get_featured_content',
            'max_posts' => 6,
        ) );
    }

}

add_action( 'after_setup_theme', 'nfw_setup' );

function nfw_restrict_search( $query ){
    if( $query->is_search ){
        $query->set( 'post_type', 'post' );
    }
    return $query;
}

add_filter( 'pre_get_posts', 'nfw_restrict_search' );

function nfw_custom_wp_title( $title, $sep ){
    global $paged, $page;

    if( is_feed() ){
        return $title;
    } // end if
    // Add the site name.
    $title = get_bloginfo( 'name' );
    $sep = '::';
    // Add the site description for the home/front page.
    $site_description = get_bloginfo( 'description', 'display' );
    if( $site_description && ( is_home() || is_front_page() ) ){
        $title = "$title $sep $site_description";
    } // end if
    // Add a page number if necessary.
    if( $paged >= 2 || $page >= 2 ){
        $title = sprintf( __( 'Page %s', 'firstone_domain' ), max( $paged, $page ) ) . " $sep $title";
    } // end if

    return esc_html( $title );
}

add_filter( 'wp_title', 'nfw_custom_wp_title', 10, 2 );

// Adds the custom CSS and the custom color schemes 
add_action( 'wp_head', 'nfw_color_scheme_styles' );

function nfw_color_scheme_styles(){
    if( !is_admin() ){
        global $nfw_theme_options;

        echo '<style type="text/css">' . "\n";

        if( is_404() ){
            echo '.wpb_content_element {margin-bottom: 35px;}';
        }

        if( is_admin_bar_showing() ){
            echo '#header.stuck { padding-top: 45px; }';
        }

        $nfw_accent_colors_enable = 0;

        if( isset( $nfw_theme_options['nfw-accent-colors-enable'] ) ){
            $nfw_accent_colors_enable = $nfw_theme_options['nfw-accent-colors-enable'];
        }

        if( $nfw_accent_colors_enable == 1 ){

            $body_font = "#4b4b4b";

            if( isset( $nfw_theme_options['nfw-color-scheme-font'] ) ){
                if( preg_match( '/(^#[0-9A-F]{6}$)|(^#[0-9A-F]{3}$)/i', $nfw_theme_options['nfw-color-scheme-font'] ) ){
                    $body_font = $nfw_theme_options['nfw-color-scheme-font'];
                }
            }

            if( $body_font != "#4b4b4b" ){
                echo 'body { color: ' . esc_attr( $body_font ) . ' !important; }';
            }

            $headline_font = "#4b4b4b";

            if( isset( $nfw_theme_options['nfw-color-scheme-headline'] ) ){
                if( preg_match( '/(^#[0-9A-F]{6}$)|(^#[0-9A-F]{3}$)/i', $nfw_theme_options['nfw-color-scheme-headline'] ) ){
                    $headline_font = $nfw_theme_options['nfw-color-scheme-headline'];
                }
            }

            if( $headline_font != "#4b4b4b" ){
                echo 'h1,
                    h2, 
                    h3, 
                    h4, 
                    h5, 
                    h6,
                    h1 a, 
                    h2 a, 
                    h3 a, 
                    h4 a, 
                    h5 a, 
                    h6 a,
                    .icon-box-content h3 a,
                    .headline h1
                    { color: ' . esc_attr( $headline_font ) . '; }';
            }

            $sticky_color = "#fff";

            if( isset( $nfw_theme_options['nfw-color-sticky-menu'] ) ){
                if( preg_match( '/(^#[0-9A-F]{6}$)|(^#[0-9A-F]{3}$)/i', $nfw_theme_options['nfw-color-sticky-menu'] ) ){
                    $sticky_color = $nfw_theme_options['nfw-color-sticky-menu'];
                }
            }

            if( $sticky_color != "#fff" ){
                echo '#header.stuck { background-color: ' . esc_attr( $sticky_color ) . '; }';
            }

            $sticky_font = "#4b4b4b";

            if( isset( $nfw_theme_options['nfw-color-sticky-color'] ) ){
                if( preg_match( '/(^#[0-9A-F]{6}$)|(^#[0-9A-F]{3}$)/i', $nfw_theme_options['nfw-color-sticky-color'] ) ){
                    $sticky_font = $nfw_theme_options['nfw-color-sticky-color'];
                }
            }

            if( $sticky_font != "#4b4b4b" ){
                echo '.stuck .sf-menu a { color: ' . esc_attr( $sticky_font ) . '; }';
            }
            
            $menu_color = "#ffffff";

            if( isset( $nfw_theme_options['nfw-color-menu'] ) ){
                if( preg_match( '/(^#[0-9A-F]{6}$)|(^#[0-9A-F]{3}$)/i', $nfw_theme_options['nfw-color-menu'] ) ){
                    $menu_color = $nfw_theme_options['nfw-color-menu'];
                }
            }

            if( $menu_color != "#ffffff" && $menu_color != "#fff" ){
                echo '.sf-menu > li > a { color: ' . esc_attr( $menu_color ) . '; }';
            }

            $footer_background = "#1b1b1b";

            if( isset( $nfw_theme_options['nfw-color-scheme-footer-background'] ) ){
                if( preg_match( '/(^#[0-9A-F]{6}$)|(^#[0-9A-F]{3}$)/i', $nfw_theme_options['nfw-color-scheme-footer-background'] ) ){
                    $footer_background = $nfw_theme_options['nfw-color-scheme-footer-background'];
                }
            }

            if( $footer_background != "#1b1b1b" ){
                echo '#footer-bottom { background-color: ' . esc_attr( $footer_background ) . '; }';
            }

            $footer_font = "#fff";

            if( isset( $nfw_theme_options['nfw-color-scheme-footer-font'] ) ){
                if( preg_match( '/(^#[0-9A-F]{6}$)|(^#[0-9A-F]{3}$)/i', $nfw_theme_options['nfw-color-scheme-footer-font'] ) ){
                    $footer_font = $nfw_theme_options['nfw-color-scheme-footer-font'];
                }
            }

            if( $footer_font != "#ffffff" && $footer_font != "#fff" ){
                echo '#footer-bottom { color: ' . esc_attr( $footer_font ) . '; }';
            }

            $color_accent_alt = "#bebebe";
            if( isset( $nfw_theme_options['nfw-color-scheme-accent-alt'] ) ){
                if( preg_match( '/(^#[0-9A-F]{6}$)|(^#[0-9A-F]{3}$)/i', $nfw_theme_options['nfw-color-scheme-accent-alt'] ) ){
                    $color_accent_alt = $nfw_theme_options['nfw-color-scheme-accent-alt'];
                }
            }
            
            if( $color_accent_alt != "#bebebe" ){
                echo '.wpb_tabs .ui-state-default.ui-corner-top a:after,
                    .btn,
                    .btn.alt:hover,
                    .page-header-content,
                    .portfolio-filter ul li a
                    { background-color: ' . esc_attr( $color_accent_alt ) . '; }';

                echo '.wpb_accordion_header.ui-accordion-header a
                    { background-color: ' . esc_attr( $color_accent_alt ) . ' !important; }';

                echo '.icon-box-1 > i,
                    .process-builder ul li span
                    { border-color: ' . esc_attr( $color_accent_alt ) . '; }';
                
                echo '.icon-box-1 > i,
                    .milestone i,
                    .process-builder ul li i
                    { color: ' . esc_attr( $color_accent_alt ) . '; }';
                
                echo '.process-builder ul:before
                    { border-top-color: ' . esc_attr( $color_accent_alt ) . '; }';
                
                echo '.commentlist li .comment-body,
                    .comment-respond,
                    #blog-post-wrap .blog-post
                    { border-bottom-color: ' . esc_attr( $color_accent_alt ) . '; }';
                
                echo '.commentlist li .comment-body:after
                    { border-right-color: ' . esc_attr( $color_accent_alt ) . '; }';
                
                $color_accent_alt_rgba = nfw_hex_to_rgba( $color_accent_alt, 0.5 );

                echo '.sticky
                    { background-color: ' . esc_attr( $color_accent_alt_rgba ) . '; }';
            }
            $color_accent = "#ffb400";
            if( isset( $nfw_theme_options['nfw-color-scheme-accent'] ) ){
                if( preg_match( '/(^#[0-9A-F]{6}$)|(^#[0-9A-F]{3}$)/i', $nfw_theme_options['nfw-color-scheme-accent'] ) ){
                    $color_accent = $nfw_theme_options['nfw-color-scheme-accent'];
                }
            }
            if( $color_accent != "#ffb400" ){
                echo 'a, 
                    a:visited,
                    .icon-box-1:hover > i,
                    .milestone:hover .milestone-content,
                    .parallax.full-screen h1 span,
                    .caption span,
                    #mobile-menu-trigger
                    { color: ' . esc_attr( $color_accent ) . '; }';

                echo '.wpb_tabs .ui-state-default.ui-corner-top a,
                    .wpb_tabs .ui-state-default.ui-corner-top a:hover,
                    .wpb_tabs .ui-state-default.ui-corner-top.ui-state-active a,
                    .btn.alt,
                    .btn:hover,
                    ul.check li:before,
                    ul.plus li:before,
                    ul.pin li:before,
                    ul.arrow li:before,
                    .process-builder ul li:hover span,
                    .parallax.full-screen .btn.alt,
                    .parallax.full-screen .arrow,
                    .pricing-table .btn:hover,
                    .pricing-table:hover .pricing-table-header,
                    .caption .btn.alt,
                    .caption a.arrow,
                    .nfw-close-iframe,
                    .mfp-ajax-holder button.mfp-close,
                    .mfp-ajax-holder .mfp-arrow-left,
                    .mfp-ajax-holder .mfp-arrow-right,
                    .nav.menu li.active,
                    .nav.menu li:hover,
                    #mobile-menu,
                    .buttons li a.btn:hover,
                    .buttons li a.btn.active,
                    .team-member-social-media,
                    .portfolio-item-overlay-actions .portfolio-item-zoom,
                    .portfolio-item-overlay-actions .portfolio-item-link,
                    .portfolio-item:hover .portfolio-item-description,
                    .portfolio-filter ul li a.active,
                    .portfolio-filter ul li a:hover,
                    .blog-post-date,
                    .nfw-current-pagination .btn
                    { background-color: ' . esc_attr( $color_accent ) . '; }';

                echo '.wpb_accordion_header a:hover,
                    .wpb_accordion_header.ui-accordion-header-active a
                    { background-color: ' . esc_attr( $color_accent ) . ' !important; }';

                echo 'input[type="text"]:focus,
                    input[type="email"]:focus,
                    input[type="url"]:focus,
                    textarea:focus,
                    .icon-box-1:hover > i,
                    .buttons li a.btn:hover,
                    .buttons li a.btn.active
                    { border-color: ' . esc_attr( $color_accent ) . '; }';

                echo '.team-member h4  
                    { border-top-color: ' . esc_attr( $color_accent ) . ' ; }';
                
                echo '.sf-menu > li.active > a:before
                    { border-bottom-color: ' . esc_attr( $color_accent ) . ' ; }';

                $color_accent_rgba = nfw_hex_to_rgba( $color_accent, 0.5 );

                echo '.team-member-overlay,
                    .portfolio-item-overlay
                    { background-color: ' . esc_attr( $color_accent_rgba ) . '; }';

                echo '.blog-post-info a:hover,
                    .blog-post-info a.btn,
                    .pagination a.btn
                    { color: #fff; }';
            }

        }

        /* Theme options custom css related field */
        $nfw_custom_css = "";
        if( isset( $nfw_theme_options['nfw-custom-css'] ) ){
            $nfw_custom_css = $nfw_theme_options['nfw-custom-css'];
        }
        if( trim( $nfw_custom_css ) != '' ){
            print $nfw_custom_css;
        }

        echo '</style>' . "\n";
    }
}

function nfw_header_scripts(){
    if( !is_admin() ){
        global $nfw_theme_options;
        if( isset( $nfw_theme_options['nfw-custom-analytics'] ) ){
            if( trim( $nfw_theme_options['nfw-custom-analytics'] ) != "" ){
                print '<script type="text/javascript">' . $nfw_theme_options['nfw-custom-analytics']. '</script>' . "\n";
            }
        }
    }
}

add_action( 'wp_head', 'nfw_header_scripts' );

/*
 * conditional statement will show the featured content if at least there is one present
 * and while the page is not being paged (it is not in the second page onwards).
 */

function nfw_get_featured_content( $num = 1 ){
    global $featured;
    $featured = apply_filters( 'nfw_featured_content', array() );

    if( is_array( $featured ) || $num >= count( $featured ) )
        return true;

    return false;
}

// A helper conditional function that returns a boolean value.
function nfw_has_featured_posts(){
    return !is_paged() && (bool) nfw_get_featured_content();
}

// Widget areas
function nfw_widgets_init(){
    require get_template_directory() . '/framework/widgets.php';
    register_widget( 'nfw_contact_widget' );
    register_widget( 'nfw_connect_social_widget' );
    register_widget( 'nfw_twitter_widget' );
    register_widget( 'nfw_flickr_widget' );
    register_widget( 'nfw_posts_widget' );

    // creates the default sidebar
    register_sidebar( array(
        'name' => __( 'Default Sidebar', 'firstone_domain' ),
        'id' => 'nfw-default-sidebar',
        'description' => __( 'Default widget area', 'firstone_domain' ),
        'before_widget' => '<div id="%1$s" class="widget %2$s">',
        'after_widget' => '</div>',
        'before_title' => '<h5 class="widget-title">',
        'after_title' => '</h5>',
    ) );

    // Generates the the top widget areas of the footer
    for( $count = 1; $count <= 4; $count++ ){
        register_sidebar( array(
            'name' => __( 'Footer Widget Area ', 'firstone_domain' ) . $count,
            'id' => 'nfw-footer-top-sidebar-' . $count,
            'description' => __( 'Widget area', 'firstone_domain' ),
            'before_widget' => '<div id="%1$s" class="widget %2$s">',
            'after_widget' => '</div>',
            'before_title' => '<h5 class="widget-title">',
            'after_title' => '</h5>',
        ) );
    }
}

add_action( 'widgets_init', 'nfw_widgets_init' );

// Default custom portfolio
add_action( 'init', 'nfw_create_portfolio_post' );

function nfw_create_portfolio_post(){
    register_post_type( 'portfolio', array(
        'labels' => array(
            'name' => __( 'Portfolio', 'firstone_domain' ),
            'singular_name' => __( 'Portfolio', 'firstone_domain' )
        ),
        'public' => true,
        'has_archive' => true,
        'show_in_nav_menus' => true,
        'supports' => array(
            'title', 'editor', 'excerpt',
            'thumbnail'),
            )
    );
}

// Registers the portfolio category
function nfw_create_portfolio_taxonomies(){
    $labels = array(
        'name' => __( 'Categories', 'firstone_domain' ),
        'singular_name' => __( 'Category', 'firstone_domain' ),
        'search_items' => __( 'Search Categories', 'firstone_domain' ),
        'all_items' => __( 'All Categories', 'firstone_domain' ),
        'parent_item' => __( 'Parent Category', 'firstone_domain' ),
        'parent_item_colon' => __( 'Parent Category:', 'firstone_domain' ),
        'edit_item' => __( 'Edit Category', 'firstone_domain' ),
        'update_item' => __( 'Update Category', 'firstone_domain' ),
        'add_new_item' => __( 'Add New Category', 'firstone_domain' ),
        'new_item_name' => __( 'New Category Name', 'firstone_domain' ),
        'menu_name' => __( 'Categories', 'firstone_domain' ),
    );

    $args = array(
        'hierarchical' => true,
        'labels' => $labels,
        'show_ui' => true,
        'show_admin_column' => true,
        'query_var' => true,
        'rewrite' => array('slug' => 'categories'),
    );

    register_taxonomy( 'portfolio_categories', array('portfolio'), $args );
}

add_action( 'init', 'nfw_create_portfolio_taxonomies', 0 );

// Pagination function
function nfw_pagination( $pages = '', $range = 3 ){
    $showitems = ($range * 2) + 1;
    //$showitems = $range-1;

    global $paged;
    if( empty( $paged ) )
        $paged = 1;

    if( $pages == '' ){
        global $wp_query;
        $pages = $wp_query->max_num_pages;
        if( !$pages ){
            $pages = 1;
        }
    }

    if( 1 != $pages ){
        echo "<ul class=\"pagination text-right fixed\">";

        if( $paged > 2 && $paged > $range + 1 && $showitems < $pages ){
            echo "<li><span title='First page'><a class='btn' href='" . esc_url( get_pagenum_link( 1 ) ) . "'>&lt;</a></span></li>";
        }

        for( $i = 1; $i <= $pages; $i++ ){
            if( 1 != $pages && (!($i >= $paged + $range + 1 || $i <= $paged - $range - 1) || $pages <= $showitems ) ){
                echo ($paged == $i) ? "<li class=\"nfw-current-pagination\"><a class='btn' href='" . esc_url( get_pagenum_link( $i ) ) . "'>" . esc_html($i) . "</a></li>" :
                        "<li><a class='btn' href='" . esc_url( get_pagenum_link( $i ) ) . "'>" . esc_html($i) . "</a></li>";
            }
        }

        if( $paged < $pages - 1 && $paged + $range - 1 < $pages && $showitems < $pages ){
            echo "<li><span title='Last page'><a class='btn' href='" . esc_url( get_pagenum_link( $pages ) ) . "'>&gt;</a></span></li>";
        }

        echo "</ul>\n";
    }
}

// Add Formats Dropdown Menu To MCE
if( !function_exists( 'nfw_style_select' ) ){

    function nfw_style_select( $buttons ){
        array_push( $buttons, 'styleselect' );
        return $buttons;
    }

}

add_filter( 'mce_buttons', 'nfw_style_select' );
// Add new styles to the TinyMCE "formats" menu dropdown
if( !function_exists( 'nfw_styles_dropdown' ) ){

    function nfw_styles_dropdown( $settings ){

        // Create array of new styles
        $new_styles = array(
            array(
                'title' => __( 'List Styles', 'firstone_domain' ),
                'items' => array(
                    array(
                        'title' => __( 'Check', 'firstone_domain' ),
                        'selector' => 'ul',
                        'classes' => 'check'
                    ),
                    array(
                        'title' => __( 'Plus', 'firstone_domain' ),
                        'selector' => 'ul',
                        'classes' => 'plus'
                    ),
                    array(
                        'title' => __( 'Pin', 'firstone_domain' ),
                        'selector' => 'ul',
                        'classes' => 'pin'
                    )
                )
            )
        );

        // Merge old & new styles
        $settings['style_formats_merge'] = true;

        // Add new styles
        $settings['style_formats'] = json_encode( $new_styles );

        // Return New Settings
        return $settings;
    }

}
add_filter( 'tiny_mce_before_init', 'nfw_styles_dropdown' );

$prefix = 'nfw_';
// Meta box structure for custom page_headers field in the edit page section of the admin
$metabox_page_header = array(
    'id' => 'nfw-page-header',
    'title' => __( 'Page Header', 'firstone_domain' ),
    'context' => 'normal',
    'priority' => 'high',
    'fields' => array(
        array(
            'name' => __( 'Header', 'firstone_domain' ),
            'id' => $prefix . 'header_toggle',
            'type' => 'radio',
            'options' => array(
                array('name' => 'On', 'value' => 'on'),
                array('name' => 'Off', 'value' => 'off')
            )
        ),
        array(
            'name' => __( 'Header image', 'firstone_domain' ),
            'id' => $prefix . 'header_image',
            'type' => 'image'
        ),
        array(
            'name' => __( 'Header title', 'firstone_domain' ),
            'id' => $prefix . 'header_title',
            'type' => 'text'
        ),
    )
);

add_action( 'admin_menu', 'nfw_page_header_add_box' );

// Add the meta box
function nfw_page_header_add_box(){
    global $metabox_page_header;
    add_meta_box( $metabox_page_header['id'], $metabox_page_header['title'], 'nfw_page_header_show_box', 'page', $metabox_page_header['context'], $metabox_page_header['priority'] );
    add_meta_box( $metabox_page_header['id'], $metabox_page_header['title'], 'nfw_page_header_show_box', 'portfolio', $metabox_page_header['context'], $metabox_page_header['priority'] );
}

// Callback function to show fields in meta box
function nfw_page_header_show_box(){
    global $metabox_page_header, $post;
    // Use nonce for verification

    echo '<input type="hidden" name="nfw_page_header_meta_box_nonce" value="', wp_create_nonce( basename( __FILE__ ) ), '" />';
    echo '<table class="form-table">';
    foreach( $metabox_page_header['fields'] as $field ){
        // Get current post meta data
        $meta = get_post_meta( $post->ID, $field['id'], true );
        echo '<tr>',
        '<th><label for="', esc_attr( $field['id'] ), '">', esc_html( $field['name'] ), '</label></th>',
        '<td>';
        switch( $field['type'] ){
            case 'radio':
                echo '<div>';
                foreach( $field['options'] as $option ){
                    // Prepare the default option
                    if( $meta == null && $option['value'] == 'on' ){
                        $default_check = 'checked="checked"';
                    } else{
                        $default_check = '';
                    }
                    echo ' <input type="radio" id="toggle-' . sanitize_html_class( $option['name'] ) . '" class="toggle toggle-' . sanitize_html_class( $option['name'] ) . '" name="', esc_attr( $field['id'] ), '" '
                    . 'value="', esc_attr( $option['value'] ), '"', $meta == $option['value'] ? ' checked="checked"' : '', ' ' . $default_check . ' />'
                    . '<label for="toggle-' . esc_attr( $option['name'] ) . '">' . esc_html( $option['name'] ) . '</label>';
                }
                echo '</div>';
                echo '<br class="clear_nfw"><br><p>' . __( 'Turn the page header On or Off for the current page', 'firstone_domain' ) . '</p>';
                break;
            case 'text':
                echo '<input type="text" name="' . esc_attr( $field['id'] ) . '" id="' . sanitize_html_class( $field['id'] ) . '" value="' . esc_attr( $meta ) . '" size="30" /><br>';
                echo '<span class="nfw_input_description">' . __( 'You can optionally add a page header title, otherwise the page name will be used as header title', 'firstone_domain' ) . '</span>';
                break;
            case 'image':
                echo '<span class="custom_default_image" style="display:none"></span>';
                if( $meta ){
                    $image = wp_get_attachment_image_src( $meta, 'medium' );
                    $image = $image[0];
                } else{
                    $image = get_template_directory_uri() . "/framework/admin/images/icons/header-image.png";
                }

                echo '<input name="' . esc_attr( $field['id'] ) . '" id="header_image_upload_input" type="hidden" class="custom_upload_image" value="' . esc_attr( $meta ) . '" />
                <img src="' . esc_url( $image ) . '" class="custom_preview_image" id="nfw_preview_header_image" alt="" /><br />
                    <input class="custom_upload_image_button button nfw_custom_image_upload_trigger" name="custom_upload_image_button" type="button" value="' . __( 'Choose Image', 'firstone_domain' ) . '" />
                    <input id="nfw_custom_clear_image_button" class="button custom_upload_image_button" value="' . __( 'Remove Image', 'firstone_domain' ) . '"  type="button">';
                echo '<br class="clear_nfw"><p>' . __( 'Select an image to be used in the header', 'firstone_domain' ) . '</p>';
                break;
        }
        echo '</td><td>',
        '</td></tr>';
    }
    echo '</table>';
}

add_action( 'save_post', 'nfw_save_page_header_data' );

// Save data from meta box
function nfw_save_page_header_data( $post_id ){
    global $metabox_page_header;
    if( isset( $_POST['nfw_page_header_meta_box_nonce'] ) ){
        // Verify nonce
        if( !wp_verify_nonce( $_POST['nfw_page_header_meta_box_nonce'], basename( __FILE__ ) ) ){
            return $post_id;
        }
        // Check autosave
        if( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE ){
            return $post_id;
        }
        // Check permissions
        if( 'page' == $_POST['post_type'] ){
            if( !current_user_can( 'edit_page', $post_id ) ){
                return $post_id;
            }
        } elseif( !current_user_can( 'edit_post', $post_id ) ){
            return $post_id;
        }
        // Populates the meta box fields with the appropriate data
        foreach( $metabox_page_header['fields'] as $field ){
            $old = get_post_meta( absint( $post_id ), sanitize_text_field( $field['id'] ), true );
            $new = $_POST[$field['id']];
            if( $new && $new != $old ){
                update_post_meta( absint( $post_id ), sanitize_text_field( $field['id'] ), sanitize_text_field( $new ) );
            } elseif( '' == $new && $old ){
                delete_post_meta( absint( $post_id ), sanitize_text_field( $field['id'] ), sanitize_text_field( $old ) );
            }
        }
    }
}

// Check autosave
if( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE ){
    return $post_id;
}

function nfw_hex_to_rgba( $color, $opacity = false ){

    $default = 'rgb(0,0,0)';

    //Return default if no color provided
    if( empty( $color ) )
        return $default;

    //Sanitize $color if "#" is provided 
    if( $color[0] == '#' ){
        $color = substr( $color, 1 );
    }

    //Check if color has 6 or 3 characters and get values
    if( strlen( $color ) == 6 ){
        $hex = array($color[0] . $color[1], $color[2] . $color[3], $color[4] . $color[5]);
    } elseif( strlen( $color ) == 3 ){
        $hex = array($color[0] . $color[0], $color[1] . $color[1], $color[2] . $color[2]);
    } else{
        return $default;
    }

    //Convert hexadec to rgb
    $rgb = array_map( 'hexdec', $hex );

    //Check if opacity is set(rgba or rgb)
    if( $opacity ){
        if( abs( $opacity ) > 1 )
            $opacity = 1.0;
        $output = 'rgba(' . implode( ",", $rgb ) . ',' . $opacity . ')';
    } else{
        $output = 'rgb(' . implode( ",", $rgb ) . ')';
    }

    //Return rgb(a) color string
    return $output;
}
