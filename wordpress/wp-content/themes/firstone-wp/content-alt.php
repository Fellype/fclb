<?php
/**
 * The template for displaying pages in a simple way for search results
 */
?>
<div <?php post_class( "blog-post" ); ?>>

    <div class="blog-post-title">

        <h3>
            <a href="<?php echo esc_url( get_permalink() ); ?>"><?php echo esc_html( get_the_title() ); ?></a>
        </h3>


        <a class="btn" href="<?php echo esc_url( get_permalink() ); ?>"><?php _e( "Read more", "firstone_domain" ); ?></a>

    </div>

</div>