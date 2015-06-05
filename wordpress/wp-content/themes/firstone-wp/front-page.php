<?php
/*
  Template Name: Front Page
 */
get_header();
if( have_posts() ){
    // Current page sidebar related meta
    $sidebar_position = get_post_meta( get_the_ID(), 'nfw_sidebar_position', true );

    // checks if a static page was selected as front page
    if( 'page' == get_option( 'show_on_front' ) ){

        // Start the Loop.
        while( have_posts() ){
            the_post();

            $post_id = get_the_ID();

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
            $content = $post->post_content;

            if( !empty( $sidebar_position ) && $sidebar_position != 'none' || strpos( $content, '[/vc_row]' ) === false ){
                echo '<div class="nfw-row">';
            }

            if( !empty( $sidebar_position ) ){
                if( $sidebar_position == 'left' ){
                    get_sidebar();
                }
            }

            if( !empty( $sidebar_position ) && $sidebar_position != 'none' ){
                echo '<div class="nfw-span9">';
            } else if( strpos( $content, '[/vc_row]' ) === false ){
                echo '<div class="nfw-span12">';
            }

            the_content();

            if( !empty( $sidebar_position ) && $sidebar_position != 'none' || strpos( $content, '[/vc_row]' ) === false ){
                echo '</div>';
            }

            if( !empty( $sidebar_position ) ){
                if( $sidebar_position == 'right' ){
                    get_sidebar();
                }
            }

            if( !empty( $sidebar_position ) && $sidebar_position != 'none' || strpos( $content, '[/vc_row]' ) === false ){
                echo '</div>';
            }
        }
    } else{
        get_template_part( 'index' );
    }
} else{
    get_template_part( 'content', 'none' );
}
get_footer();
