<?php
/**
 * The template for displaying Comments
 *
 * The area of the page that contains comments and the comment form.
 */
/*
 * If the current post is protected by a password and the visitor has not yet
 * entered the password we will return early without loading the comments.
 */
if( post_password_required() ){
    return;
}
?>

<div id="comments" class="comments-area">

    <?php if( have_comments() ) : ?>

        <h3 class="comments-title"><?php _e( 'Comments', 'firstone_domain' ); ?></h3>
        <ol class="commentlist">
            <?php
            // Lists user comments
            wp_list_comments( array(
                'style' => 'ol',
                'short_ping' => false,
                'avatar_size' => 80,
            ) );
            ?>
        </ol>

        <?php
        // Comment navigation
        if( get_comment_pages_count() > 1 && get_option( 'page_comments' ) ) :
            ?>
            <nav role="navigation">
                <h1><?php _e( 'Comment navigation', 'firstone_domain' ); ?></h1>
                <div class="nav-previous"><?php previous_comments_link( '&larr;' . __( ' Older Comments', 'firstone_domain' ) ); ?></div>
                <div class="nav-next"><?php next_comments_link( __( 'Newer Comments ', 'firstone_domain' ) . '&rarr;' ); ?></div>
            </nav>
        <?php endif; ?>

        <?php if( !comments_open() ) : ?>
            <p class="no-comments"><?php _e( 'Comments are closed.', 'firstone_domain' ); ?></p>
            <?php
        endif;
    endif;
    ?>

    <?php
    // Displays the comment form with customized html
    comment_form(
            array(
                'cancel_reply_link' => __( 'Cancel reply', 'firstone_domain' ),
                'label_submit' => __( 'Send', 'firstone_domain' ),
                'title_reply' => __( 'Leave a reply', 'firstone_domain' ),
                'id_form' => 'comment-form',
                'comment_notes_after' => '',
                'comment_notes_before' => '',
                'comment_field' => '<p class="nfw-row">'
                . '<textarea class="nfw-span6" id="comment" name="comment" cols="45" rows="8" aria-required="true" placeholder="' . __( 'message', 'firstone_domain' ) . '">' .
                '</textarea></p>',
                'fields' => array(  
                    'author' => '<div class="nfw-row"><input class="nfw-span4" id="author" name="author" type="text" value="" placeholder="' . __( 'name', 'firstone_domain' ) . '" size="30" /></div>',
                    'email' => '<div class="nfw-row"><input class="nfw-span4" id="email" name="email" type="text" value="" placeholder="' . __( 'e-mail', 'firstone_domain' ) . '" size="30" /></div>',
                    'subject' => '<div class="nfw-row"><input class="nfw-span4" id="subject" name="subject" type="text" value="" placeholder="' . __( 'subject', 'firstone_domain' ) . '" size="30" /></div>',
                ),
            )
    );
    ?>

</div>