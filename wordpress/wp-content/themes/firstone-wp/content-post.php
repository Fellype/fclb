<?php
/*
 * Template used for displaying the single posts content
 */
?>
<div <?php
if( is_sticky() ){
    post_class( "blog-post sticky" );
} else{
    post_class( "blog-post" );
}
?>>

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

        <?php
        the_content( '' );
        wp_link_pages();
        posts_nav_link();
        wp_kses( the_tags(), array('a' => array(
                'href' => true,
                'rel' => true
            ),) );
        ?>

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

</div><!-- end .blog-post -->

<?php
comments_template();
?>  