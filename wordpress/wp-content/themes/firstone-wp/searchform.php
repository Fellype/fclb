<?php
/*
 * Search form template
 */
?>
<form action="<?php echo esc_url( home_url( '/' ) ); ?>" class="searchform" id="searchform" method="get" name="searchform">
    <div>
        <label class="screen-reader-text" for="s"><?php _e( 'Search for:', 'firstone_domain' ); ?></label> 
        <input id="s" name="s" type="text" value=""> 
        <input id="searchsubmit" type="submit" value="">
    </div>
</form>