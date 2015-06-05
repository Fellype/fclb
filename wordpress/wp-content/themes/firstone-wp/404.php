<?php
/**
 * Template Name: 404
 * The template for displaying 404 pages (Not Found)
 */
get_header();
global $nfw_theme_options;

$nfw_404_selection = "";
if( isset( $nfw_theme_options['nfw-404-selection'] ) ){
    $nfw_404_selection = $nfw_theme_options['nfw-404-selection'];
}

// Verifies if a certain a custom page was selected to be displayed as the 404 page
if( $nfw_404_selection == 'default' || $nfw_404_selection == '' || get_permalink( $nfw_404_selection ) == '' ){
    // Display the default 404 page content
    $post_id = get_option( 'page_for_posts' );
    $page_header_toggle = get_post_meta( $post_id, 'nfw_header_toggle', true );
    if( $page_header_toggle == 'on'   || $page_header_toggle == null ):
        $page_header_title = get_post_meta( $post_id, 'nfw_header_title', true );
        $page_header_image = get_post_meta( $post_id, 'nfw_header_image', true );
        // Sets the Page header image
        $image = wp_get_attachment_image_src( $page_header_image, 'full' );
        $image_url = $image[0];
        if( trim( $image_url ) == '' ){
            $image_url = get_template_directory_uri() . '/layout/images/bg-page-header.jpg';
            global $nfw_theme_options;
            if( isset( $nfw_theme_options['nfw-header-background-image'] ) ){

                if( trim( $nfw_theme_options['nfw-header-background-image']['url'] ) != '' ){
                    $image_url = $nfw_theme_options['nfw-header-background-image']['url'];
                }
            }
        }
        if( trim( $page_header_title ) == '' ){
            $page_header_title = get_the_title();
        }
        ?>
        <div id="page-header">

            <img src="<?php echo esc_url( $image_url ); ?>" alt="">

            <div class="page-header-content">

                <div class="nfw-row">
                    <div class="nfw-span12">
                        <?php echo '<p>' . esc_html( $page_header_title ) . '</p>'; ?>
                    </div><!-- end .nfw-span12 -->
                </div><!-- end .row -->

            </div><!-- end .page-header-content -->

        </div><!-- end #page-header -->
        <?php
    endif;
    ?>  
    <br><br>
    <div class="nfw-row">
        <div class="nfw-span12">

            <div class="text-center">
                <header>
                    <h1><?php _e( 'Not Found', 'firstone_domain' ); ?></h1>
                </header>
            </div>

            <div class="text-center">
                <p><?php _e( 'Nothing was found at this location.', 'firstone_domain' ); ?></p>

                <?php get_search_form(); ?>
            </div>

        </div>
    </div>
    <?php
} else{
    // A custom page was selected to be displayed as the 404 page    
    $post_id = $nfw_404_selection;

    $page_header_toggle = get_post_meta( $post_id, 'nfw_header_toggle', true );
    if( $page_header_toggle == 'on' || $page_header_toggle == null ):
        $page_header_title = get_post_meta( $post_id, 'nfw_header_title', true );
        $page_header_image = get_post_meta( $post_id, 'nfw_header_image', true );
        // Sets the Page header image
        $image = wp_get_attachment_image_src( $page_header_image, 'full' );
        $image_url = $image[0];
        if( trim( $image_url ) == '' ){
            $image_url = get_template_directory_uri() . '/layout/images/bg-page-header.jpg';
            global $nfw_theme_options;
            if( isset( $nfw_theme_options['nfw-header-background-image'] ) ){

                if( trim( $nfw_theme_options['nfw-header-background-image']['url'] ) != '' ){
                    $image_url = $nfw_theme_options['nfw-header-background-image']['url'];
                }
            }
        }
        if( trim( $page_header_title ) == '' ){
            $page_header_title = get_the_title();
        }
        ?>
        <div id="page-header">

            <img src="<?php echo esc_url( $image_url ); ?>" alt="">

            <div class="page-header-content">

                <div class="nfw-row">
                    <div class="nfw-span12">
                        <?php echo '<p>' . esc_html( $page_header_title ) . '</p>'; ?>
                    </div><!-- end .nfw-span12 -->
                </div><!-- end .row -->

            </div><!-- end .page-header-content -->

        </div><!-- end #page-header -->
        <?php
    endif;
    ?>  
    <div class="nfw-row">
        <?php
        // Current page sidebar related meta
        $sidebar_position = get_post_meta( $nfw_404_selection, 'nfw_sidebar_position', true );

        if( !empty( $sidebar_position ) ){
            if( $sidebar_position == 'left' ){
                get_sidebar();
            }
        }
        if( !empty( $sidebar_position ) && $sidebar_position != 'none' ){
            // There is a sidebar content will be in a span8
            ?>
            <div class="nfw-span9">   
                <?php
            } else{
                // There is no sidebar, content will be in a span12
                ?>
                <div class="nfw-span12">  
                    <?php
                }
                // Gets and displays the content of the page selected for the 404
                global $post;
                $post = get_post( $nfw_404_selection );
                setup_postdata( $post, null, false );

                if( $post != null ){
                    the_content();
                } else{
                    get_template_part( 'content', 'none' );
                }
                wp_reset_postdata( $post );
                ?>
            </div>
            <?php
            if( !empty( $sidebar_position ) ){
                if( $sidebar_position == 'right' ){
                    get_sidebar();
                }
            }
            ?>
        </div>
        <?php
    }
    get_footer();
    