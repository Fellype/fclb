<?php
/**
 * The template for displaying posts with no or standard format
 */
?>
<div <?php post_class( "blog-post" ); ?>>

    <?php if( has_post_thumbnail() ): ?>

        <div class="blog-post-thumb">
            <?php the_post_thumbnail(); ?>
        </div><!-- end .blog-post-thumb -->

    <?php endif; ?>

    <div class="blog-post-title">

        <h4>
            <strong><a href="<?php echo esc_url( get_permalink() ); ?>"><?php echo esc_html( get_the_title() ); ?></a></strong>
        </h4>

        <h6>
            <?php _e( "By: ", "firstone_domain" ); ?>
            <strong><?php echo esc_html( get_the_author() ); ?></strong> 
            <?php
            _e( " in ", "firstone_domain" );
            $categories = get_the_category();
            echo ' <a href="' . esc_url( get_category_link( $categories[0]->term_id ) ) . '">';
            echo esc_html( $categories[0]->name );
            echo '</a>';
            ?>
        </h6>

    </div><!-- end .blog-post-title -->

    <div class="blog-post-info">

        <p><?php echo wp_kses_post( get_the_excerpt() ); ?></p>

        <p>
            <a class="btn text-uppercase" href="<?php echo esc_url( get_permalink() ); ?>"><?php _e( "Read more", "firstone_domain" ); ?></a>
        </p>

    </div><!-- end .blog-post-info -->

    <?php if( has_post_thumbnail() ): ?>

        <div class="blog-post-date">

            <?php
            $post_date = get_the_date( 'd M' );
            $post_date_parts = explode( ' ', $post_date );
            echo esc_html( $post_date_parts[0] ) . '</br><small>' . esc_html( $post_date_parts[1] ) . '</small>';
            ?>

        </div><!-- end .blog-post-date -->
    <?php endif; ?>

</div>