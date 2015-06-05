<?php
/**
 * The template for displaying a "No posts found" message
 */
?>
<div class="nfw-span6">
    <header>
        <h3><?php _e( 'Nothing Found', 'firstone_domain' ); ?></h3>
    </header>

    <div>
        <?php if( is_home() && current_user_can( 'publish_posts' ) ) : ?>

            <p><?php
                echo __( 'Ready to publish your first post?', 'firstone_domain' )
                . '<a href="' . esc_url( admin_url( 'post-new.php' ) ) . '">'
                . __( 'Get started here', 'firstone_domain' ) . '</a>.';
                ?></p>

        <?php elseif( is_search() ) : ?>

            <p><?php echo __( 'There are no search results for ', 'firstone_domain' ) . get_search_query(); ?></p>
            <?php get_search_form(); ?>

        <?php else : ?>

            <p><?php _e( 'It seems we cannot find what you are looking for. Perhaps searching can help.', 'firstone_domain' ); ?></p>
            <?php get_search_form(); ?>

        <?php endif; ?>
    </div>
</div>