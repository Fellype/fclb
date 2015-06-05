<?php

add_action( 'wp_ajax_nfw_custom_posts_isotope', 'nfw_custom_posts_isotope' );
add_action( 'wp_ajax_nopriv_nfw_custom_posts_isotope', 'nfw_custom_posts_isotope' );

// Provides the response results for load more grid type portfolio
function nfw_custom_posts_isotope(){

    /*
     * Verifies if the ajax call was made fom the portfolio load more button, 
     * based on the WordPress generated nonce of the request
     */
    if( !wp_verify_nonce( $_REQUEST['nonce'], 'nfw_custom_posts_isotope_nonce' ) ){
        exit( 'Access Denied!!!!' );
    }

    $custom_post_type = sanitize_text_field( $_REQUEST['custom_post_type'] );
    $count_total = absint( $_REQUEST['count_total'] );

    $count_portfolios = wp_count_posts( 'portfolio' );

    $published_portfolios = $count_portfolios->publish;

    $output = '';

    if( $count_total <= $published_portfolios ){
        $result['content_elements'] = 1;

        $args = array(
            'post_type' => $custom_post_type,
            'post_status' => 'publish',
            'posts_per_page' => $count_total,
            'ignore_sticky_posts' => 1);

        $loop = new WP_Query( $args );

        // get portfolio categories array
        $terms = get_terms( 'portfolio_categories' );



        $count = 0;
        $categories_index = array();
        $post_categories = array();

        // Counts and records the categories
        if( $terms && !is_wp_error( $terms ) ){
            foreach( $terms as $term ){
                $count++;
                $categories_index[$term->name] = $count;
            }
        }

        while( $loop->have_posts() ){

            $terms_class = "item";
            $loop->the_post();
            $post_id = get_the_ID();

            $post_categories = get_the_terms( $post_id, 'portfolio_categories' );

            $thumbnail_id = get_post_thumbnail_id();

            $image_data = wp_get_attachment_image_src( $thumbnail_id, 'nfw_image_400_400' );

            $image_url = esc_url( $image_data[0] );

            $image_data_full = wp_get_attachment_image_src( $thumbnail_id, 'full' );

            $image_url_full = esc_url( $image_data_full[0] );

            $post_title = esc_html( get_the_title( $post_id ) );

            $post_link = esc_url( get_post_permalink( $post_id ) );

            $one_category = '';
            $icon_link = esc_url( get_template_directory_uri() . '/layout/images/icon-link.png' );
            $icon_zoom = esc_url( get_template_directory_uri() . '/layout/images/icon-zoom.png' );

            if( !empty( $post_categories ) && !empty( $categories_index ) ){
                foreach( $post_categories as $category ){
                    $terms_class.=" term-" . esc_attr( $categories_index[$category->name] );
                }
                $one_category = $category->name;
            }

            $content_link = $post_link . '?portfolio_post=' . $post_id;

            // Composes the html data for the current loop item and appends it to the output                  
            $output.= "<li class='{$terms_class}'>

                                <div class='portfolio-item'>

                                    <div class='portfolio-item-preview'>

                                        <img src='{$image_url}' alt=''>

                                        <div class='portfolio-item-overlay'>

                                            <div class='portfolio-item-description'>

                                                <h2>{$post_title}</h2>
                                                <h4>{$one_category}</h4>

                                            </div><!-- end .portfolio-item-description -->

                                            <div class='portfolio-item-overlay-actions'>

                                                <a class='portfolio-item-link' onclick='nfw_iframe_popup(this)' data-portfolio_post_src='{$content_link}'>
                                                    <img src='{$icon_link}' alt=''>
                                                </a>

                                                <a class='magnificPopup-gallery portfolio-item-zoom' href='{$image_url_full}'>                                            
                                                    <img src='{$icon_zoom}' alt=''>
                                                </a>

                                            </div><!-- end .portfolio-item-overlay-actions -->

                                        </div><!-- end .portfolio-item-overlay -->

                                    </div><!-- end .portfolio-item-preview -->

                                </div><!-- end .portfolio-item -->

                            </li>";
        }
        wp_reset_query();
    } 
    if($count_total >= $published_portfolios){
        $result['content_elements'] = 0;
    }

    $result['list_elements'] = $output;

    // Verifies the HTTP request
    if( !empty( $_SERVER['HTTP_X_REQUESTED_WITH'] ) && strtolower( $_SERVER['HTTP_X_REQUESTED_WITH'] ) == 'xmlhttprequest' ){
        // Encodes and provides the response output
        echo json_encode( $result );
    } else{
        header( 'Location: ' . $_SERVER["HTTP_REFERER"] );
    }

    die();
}
