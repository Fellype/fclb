<?php
/**
 * The template for displaying Archive pages
 */
get_header();
$post_id = get_option( 'page_for_posts' );
// Get Blog related header meta
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
    $sidebar_position = get_post_meta( $post_id, 'nfw_sidebar_position', true );
    if( $post_id == 0 ){
        $sidebar_position = 'right';
    }

    if( !empty( $sidebar_position ) ){
        if( $sidebar_position == 'left' ){
            get_sidebar();
        }
    }

    if( !empty( $sidebar_position ) && $sidebar_position != 'none' ){
        // There is a sidebar, posts will be fitted in a span9
        if( have_posts() ) :
            ?> 
            <div class="nfw-span9">   
                <div class="alert info">
                    <strong><?php
                        if( is_day() ) :
                            echo __( 'Viewing posts from : ', 'firstone_domain' ) . esc_html( get_the_date() );

                        elseif( is_month() ) :
                            echo __( 'Viewing posts from : ', 'firstone_domain' ) . esc_html( get_the_date( _x( 'F Y', 'monthly archives date format', 'firstone_domain' ) ) );

                        elseif( is_year() ) :
                            echo __( 'Viewing posts from : ', 'firstone_domain' ) . esc_html( get_the_date( _x( 'Y', 'yearly archives date format', 'firstone_domain' ) ) );

                        else :
                            _e( 'Archives!', 'firstone_domain' );

                        endif;
                        ?></strong>
                </div>
                <?php
                while( have_posts() ) : the_post();
                    get_template_part( 'content', get_post_format() );
                endwhile;
                if( function_exists( "nfw_pagination" ) ){
                    nfw_pagination();
                }
                ?>
            </div>

            <?php
        else :
            ?>
            <div class="nfw-span9">
                <div class="alert info">
                    <strong><?php
                        if( is_day() ) :
                            echo __( 'Viewing posts from : ', 'firstone_domain' ) . esc_html( get_the_date() );

                        elseif( is_month() ) :
                            echo __( 'Viewing posts from : ', 'firstone_domain' ) . esc_html( get_the_date( _x( 'F Y', 'monthly archives date format', 'firstone_domain' ) ) );

                        elseif( is_year() ) :
                            echo __( 'Viewing posts from : ', 'firstone_domain' ) . esc_html( get_the_date( _x( 'Y', 'yearly archives date format', 'firstone_domain' ) ) );

                        else :
                            _e( 'Archives!', 'firstone_domain' );

                        endif;
                        ?></strong>
                </div>
                <?php
                // If no content, include the "No posts found" template.
                get_template_part( 'content', 'none' );
                ?>
            </div>
        <?php
        endif;
    } else{
        // there is no sidebar, posts will be fitted in a span12
        if( have_posts() ) :
            ?>

            <div class="nfw-span12">   
                <div class="alert info">
                    <strong><?php
                        if( is_day() ) :
                            echo __( 'Viewing posts from : ', 'firstone_domain' ) . esc_html( get_the_date() );

                        elseif( is_month() ) :
                            echo __( 'Viewing posts from : ', 'firstone_domain' ) . esc_html( get_the_date( _x( 'F Y', 'monthly archives date format', 'firstone_domain' ) ) );

                        elseif( is_year() ) :
                            echo __( 'Viewing posts from : ', 'firstone_domain' ) . esc_html( get_the_date( _x( 'Y', 'yearly archives date format', 'firstone_domain' ) ) );

                        else :
                            _e( 'Archives!', 'firstone_domain' );

                        endif;
                        ?></strong>
                </div>
                <?php
                while( have_posts() ) : the_post();
                    get_template_part( 'content', get_post_format() );
                endwhile;
                if( function_exists( "nfw_pagination" ) ){
                    nfw_pagination();
                }
                ?>
            </div>

            <?php
        else :
            ?>
            <div class="nfw-span12">
                <div class="alert info">
                    <strong><?php
                        if( is_day() ) :
                            echo __( 'Viewing posts from : ', 'firstone_domain' ) . esc_html( get_the_date() );

                        elseif( is_month() ) :
                            echo __( 'Viewing posts from : ', 'firstone_domain' ) . esc_html( get_the_date( _x( 'F Y', 'monthly archives date format', 'firstone_domain' ) ) );

                        elseif( is_year() ) :
                            echo __( 'Viewing posts from : ', 'firstone_domain' ) . esc_html( get_the_date( _x( 'Y', 'yearly archives date format', 'firstone_domain' ) ) );

                        else :
                            _e( 'Archives!', 'firstone_domain' );

                        endif;
                        ?></strong>
                </div>
                <?php
                // If no content, include the "No posts found" template.
                get_template_part( 'content', 'none' );
                ?>
            </div>
        <?php
        endif;
    }

    if( !empty( $sidebar_position ) ){
        if( $sidebar_position == 'right' ){
            get_sidebar();
        }
    }
    ?>
</div> 
<?php
get_footer();
