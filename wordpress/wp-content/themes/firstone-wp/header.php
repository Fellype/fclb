<?php
/**
 * The Header template for nfw theme
 */
?>
<!DOCTYPE html>
<html <?php language_attributes(); ?> class="no-js">
    <head>
        <meta charset="<?php echo esc_attr( bloginfo( 'charset' ) ); ?>">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/> 

        <?php
        global $nfw_theme_options;
        ?>

        <!-- /// Favicons ////////  -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<?php
        if( isset( $nfw_theme_options['nfw-appleicon-selector'] ) ){
            echo esc_url( $nfw_theme_options['nfw-appleicon-selector']['url'] );
        }
        ?>">
        <link rel="shortcut icon" href="<?php
        if( isset( $nfw_theme_options['nfw-favicon-selector'] ) ){
            echo esc_url( $nfw_theme_options['nfw-favicon-selector']['url'] );
        }
        ?>"> 

        <?php
        wp_head();
        ?>
    </head>

    <body <?php body_class( ); ?>>
        <div id="pageloader">
            <div class="loader-img">
                <?php
                if( isset( $nfw_theme_options['nfw-preloader-image'] ) ):
                    if( trim( $nfw_theme_options['nfw-preloader-image']['url'] ) != '' ):
                        ?>
                        <img src="<?php echo esc_url( $nfw_theme_options['nfw-preloader-image']['url'] ); ?>" alt=""> 
                    <?php
                    endif;
                endif;
                ?>
            </div><!-- end .loader-img -->
        </div>
        <noscript>
        <div class="alert warning">
            <i class="fa fa-times-circle"></i><?php _e( 'You seem to have Javascript disabled. This website needs javascript in order to function properly!', 'firstone_domain' ); ?>
        </div>
        </noscript>

        <!--[if lte IE 8]>
         <div class="alert error">
        <?php _e( 'You are using an <strong>outdated</strong> browser. Please 
                <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">upgrade your browser</a> to improve your experience.', 'firstone_domain' ); ?>
                </div>
    <![endif]-->

        <div id="wrap">
            <header>
                <div id="header">

                    <!-- /// HEADER  ///////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

                    <div class="nfw-row">
                        <div class="nfw-span3">

                            <!-- // Logo // -->

                            <a href="<?php echo esc_url( home_url() ); ?>" id="logo">
                                <img src="<?php
                                if( isset( $nfw_theme_options['nfw-header-logo'] ) ){
                                    echo esc_url( $nfw_theme_options['nfw-header-logo']['url'] );
                                }
                                ?>" alt="" class="responsive-img">
                            </a>

                        </div><!-- end .nfw-span3 -->
                        <div class="nfw-span9">

                            <!-- // Mobile menu trigger // -->
                            <a href="#" id="mobile-menu-trigger">
                                <i class="fa fa-bars"></i>
                            </a>

                            <!-- // Menu // -->

                            <?php
                            // Wordpress navigation menu
                            if( has_nav_menu( 'nfw-firstone-menu' ) ){
                                wp_nav_menu( array(
                                    'theme_location' => 'nfw-firstone-menu',
                                    'container' => false,
                                    'fallback_cb' => false,
                                    'items_wrap' => '<ul id="menu" class="sf-menu fixed">%3$s</ul>',
                                        )
                                );
                            }
                            ?>

                        </div><!-- end .nfw-span9 -->
                    </div><!-- end .row -->

                    <!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

                </div><!-- end #header -->

            </header>

            <div id="content">