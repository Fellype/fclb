<?php
/**
 * The template for displaying the footer
 */
?>
</div><!-- content / End -->

<?php
global $nfw_theme_options;

// Footer layout options
$nfw_footer_top_switch = $nfw_footer_top_layout = "";

if( isset( $nfw_theme_options['nfw-footer-top-switch'] ) ){
    $nfw_footer_top_switch = $nfw_theme_options['nfw-footer-top-switch'];
}
if( isset( $nfw_theme_options['nfw-footer-top-layout'] ) ){
    $nfw_footer_top_layout = $nfw_theme_options['nfw-footer-top-layout'];
}

if( $nfw_footer_top_switch == 1 ):
    ?>
    <div id="footer-bottom">

        <div class="nfw-row">

            <?php
            // Sets widget area classes for top footer
            $top_layout_class = "nfw-span3";

            if( $nfw_footer_top_layout == 3 ){
                $top_layout_class = "nfw-span4";
            } elseif( $nfw_footer_top_layout == 2 ){
                $top_layout_class = "nfw-span6";
            } elseif( $nfw_footer_top_layout == 1 ){
                $top_layout_class = "nfw-span12";
            }
            ?>

            <?php
            // 1 widget area for top footer
            if( $nfw_footer_top_layout >= 1 ):
                ?>
                <div class="<?php echo sanitize_html_class( $top_layout_class ); ?>" id="footer-top-widget-area-1">

                    <?php
                    if( function_exists( 'dynamic_sidebar' ) ){

                        if( is_active_sidebar( 'nfw-footer-top-sidebar-1' ) ){
                            dynamic_sidebar( 'nfw-footer-top-sidebar-1' );
                        }
                    }
                    ?>

                </div>
            <?php endif; ?>

            <?php
            // 2 widget areas for top footer
            if( $nfw_footer_top_layout >= 2 ):
                ?>
                <div class="<?php echo sanitize_html_class( $top_layout_class ); ?>" id="footer-top-widget-area-2">

                    <?php
                    if( function_exists( 'dynamic_sidebar' ) ){

                        if( is_active_sidebar( 'nfw-footer-top-sidebar-2' ) ){
                            dynamic_sidebar( 'nfw-footer-top-sidebar-2' );
                        }
                    }
                    ?>

                </div>
            <?php endif; ?>

            <?php
            // 3 widget areas for top footer
            if( $nfw_footer_top_layout >= 3 ):
                ?>
                <div class="<?php echo sanitize_html_class( $top_layout_class ); ?>" id="footer-top-widget-area-3">

                    <?php
                    if( function_exists( 'dynamic_sidebar' ) ){

                        if( is_active_sidebar( 'nfw-footer-top-sidebar-3' ) ){
                            dynamic_sidebar( 'nfw-footer-top-sidebar-3' );
                        }
                    }
                    ?>

                </div>
            <?php endif; ?>

            <?php
            // 4 widget areas for top footer
            if( $nfw_footer_top_layout == 4 ):
                ?>
                <div class="<?php echo sanitize_html_class( $top_layout_class ); ?>" id="footer-top-widget-area-4">

                    <?php
                    if( function_exists( 'dynamic_sidebar' ) ){

                        if( is_active_sidebar( 'nfw-footer-top-sidebar-4' ) ){
                            dynamic_sidebar( 'nfw-footer-top-sidebar-4' );
                        }
                    }
                    ?>

                </div>
            <?php endif; ?>

        </div>

    </div>
<?php endif; ?>
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

</div><!-- wrapper / End -->

<?php
if( isset( $nfw_theme_options['nfw-backtotop-toggle'] ) ){
    if( $nfw_theme_options['nfw-backtotop-toggle'] == 1 ){
        ?>
        <!-- Back to top navigation -->
        <a id="back-to-top" href="#">
            <i class="fa fa-angle-up"></i>
        </a>
        <?php
    }
}
?>

<?php
wp_footer();
?>

</body>
</html>