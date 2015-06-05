<?php

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       THEME OPTIONS FRAMEWORK files and settings
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Initiates the theme options class
if( !class_exists( 'ReduxFramework' ) && file_exists( dirname( __FILE__ ) . '/admin/theme-options/ReduxCore/framework.php' ) ){
    require_once( dirname( __FILE__ ) . '/admin/theme-options/ReduxCore/framework.php' );
}

// Initiates the configuration file
if( !isset( $nfw_theme_options ) && file_exists( dirname( __FILE__ ) . '/admin/theme-options/sample/sample-config.php' ) ){
    require_once( dirname( __FILE__ ) . '/admin/theme-options/sample/sample-config.php' );
}

// Intiates the custom fields extensions for theme-options
if( file_exists( dirname( __FILE__ ) . '/admin/theme-options/extensions/extension_custom_sidebars.php' ) &&
        file_exists( dirname( __FILE__ ) . '/admin/theme-options/extensions/custom_sidebars/field_custom_sidebars.php' ) ){
    require_once(dirname( __FILE__ ) . '/admin/theme-options/extensions/extension_custom_sidebars.php');
    require_once(dirname( __FILE__ ) . '/admin/theme-options/extensions/custom_sidebars/field_custom_sidebars.php');
}

// Removes the demo
function nfw_removeDemoModeLink(){
    if( class_exists( 'ReduxFrameworkPlugin' ) ){
        remove_filter( 'plugin_row_meta', array(ReduxFrameworkPlugin::get_instance(), 'plugin_metalinks'), null, 2 );
    }
    if( class_exists( 'ReduxFrameworkPlugin' ) ){
        remove_action( 'admin_notices', array(ReduxFrameworkPlugin::get_instance(), 'admin_notices') );
    }
}

add_action( 'init', 'nfw_removeDemoModeLink' );

// Theme options global
global $nfw_theme_options;

// Checks if there are custom sidebars option is set
if( isset( $nfw_theme_options['nfw-sidebars-custom'] ) ){

    // handles the sidebars data
    if( is_array( $nfw_theme_options['nfw-sidebars-custom'] ) ){
        $count = count( $nfw_theme_options['nfw-sidebars-custom'] );
        $j = 0;
        // Check there are any sidebars recorded at all
        for( $i = 0; $i < $count; $i = $i + 2 ){

            if( $nfw_theme_options['nfw-sidebars-custom'][$i] != '' ){
                // Stores sidebars titles
                $sidebars_title[$j] = esc_html( $nfw_theme_options['nfw-sidebars-custom'][$i] );
                // Stores sidebars description
                $sidebars_description[$j] = esc_html( $nfw_theme_options['nfw-sidebars-custom'][$i + 1] );

                if( function_exists( 'register_sidebar' ) ){
                    // Registers each sidebar with title and description
                    register_sidebar( array(
                        'name' => $sidebars_title[$j],
                        'description' => $sidebars_description[$j],
                        'before_widget' => '<div id="%1$s" class="widget %2$s">',
                        'after_widget' => '</div>',
                        'before_title' => '<h3 class="widget-title">',
                        'after_title' => '</h3>',
                    ) );
                }
                $j++;
            }
        }
    }
}

$sidebars_title[] = 'Default Sidebar';
$prefix = 'nfw_';
// Meta box structure for custom sidebars field in the edit page section of the admin
$meta_box = array(
    'id' => 'nfw-page-sidebar',
    'title' => __( 'Page Layout and Sidebar Manager', 'firstone_domain' ),
    'page' => 'page',
    'context' => 'normal',
    'priority' => 'high',
    'fields' => array(
        // Sidebar positioning options
        array(
            'name' => __( 'Page Layout', 'firstone_domain' ),
            'id' => $prefix . 'sidebar_position',
            'type' => 'radio',
            'options' => array(
                array('name' => 'Left', 'value' => 'left'),
                array('name' => 'None', 'value' => 'none'),
                array('name' => 'Right', 'value' => 'right')
            )
        ),
        // Sidebars list
        array(
            'name' => __( 'Sidebar', 'firstone_domain' ),
            'id' => $prefix . 'sidebar_source',
            'type' => 'select',
            'options' => $sidebars_title
        )
    )
);

add_action( 'admin_menu', 'nfw_siderbar_add_box' );

// Add the meta box
function nfw_siderbar_add_box(){
    global $meta_box;
    add_meta_box( $meta_box['id'], $meta_box['title'], 'nfw_siderbar_show_box', $meta_box['page'], $meta_box['context'], $meta_box['priority'] );
}

$meta_box_portfolio = array(
    'id' => 'nfw-portfolio-sidebar',
    'title' => __( 'Page Layout and Sidebar Manager', 'firstone_domain' ),
    'page' => 'portfolio',
    'context' => 'normal',
    'priority' => 'high',
    'fields' => array(
        // Sidebar positioning options
        array(
            'name' => __( 'Page Layout', 'firstone_domain' ),
            'id' => $prefix . 'sidebar_position',
            'type' => 'radio',
            'options' => array(
                array('name' => 'Left', 'value' => 'left'),
                array('name' => 'None', 'value' => 'none'),
                array('name' => 'Right', 'value' => 'right')
            )
        ),
        // Sidebars list
        array(
            'name' => __( 'Sidebar', 'firstone_domain' ),
            'id' => $prefix . 'sidebar_source_portfolio',
            'type' => 'select',
            'options' => $sidebars_title
        )
    )
);

add_action( 'admin_menu', 'nfw_siderbar_add_portfolio_box' );

// Add the portfolio meta box
function nfw_siderbar_add_portfolio_box(){
    global $meta_box_portfolio;
    add_meta_box( $meta_box_portfolio['id'], $meta_box_portfolio['title'], 'nfw_siderbar_show_box', $meta_box_portfolio['page'], $meta_box_portfolio['context'], $meta_box_portfolio['priority'] );
}

// Callback function to show fields in meta box
function nfw_siderbar_show_box(){
    global $meta_box, $post;
    // Use nonce for verification

    echo '<input type="hidden" name="nfw_sidebar_meta_box_nonce" value="'. esc_attr(wp_create_nonce( basename( __FILE__ ) )) .'" />';
    echo '<table class="form-table">';
    foreach( $meta_box['fields'] as $field ){
        // Get current post meta data
        $meta = get_post_meta( $post->ID, $field['id'], true );
        echo '<tr>',
        '<th style="width:20%"><label for="', esc_attr( $field['id'] ), '">', esc_html( $field['name'] ), '</label></th>',
        '<td>';
        switch( $field['type'] ){
            case 'radio':
                echo '<div>';
                foreach( $field['options'] as $option ){
                    echo '<div class="sidebar_icon_radio">';
                    $check_title = '';
                    switch( $option['value'] ){
                        case 'left':
                            echo '<img title="' . __( 'Sidebar on the left', 'firstone_domain' ) . '" src="' . esc_url(get_template_directory_uri()) . '/framework/admin/images/icons/icon_sidebar_left.png" title="sidebar left">';
                            break;
                        case 'none':
                            echo '<img title="' . __( 'No Sidebar', 'firstone_domain' ) . '" src="' . esc_url(get_template_directory_uri()) . '/framework/admin/images/icons/icon_sidebar_none.png" title="sidebar none">';
                            break;
                        case 'right':
                            echo '<img title="' . __( 'Sidebar on the right', 'firstone_domain' ) . '" src="' . esc_url(get_template_directory_uri()) . '/framework/admin/images/icons/icon_sidebar_right.png" title="sidebar right">';
                            break;
                    }
                    // Prepare the default option
                    if( $meta == null && $option['value'] == 'none' ){
                        $default_check = 'checked="checked"';
                    } else{
                        $default_check = '';
                    }
                    echo '<br><div class="sidebar_position_option_style">'
                    . '<input title="' . __( 'No Sidebar', 'firstone_domain' ) . '" type="radio" name="', esc_attr( $field['id'] ), '" '
                    . 'value="', esc_attr( $option['value'] ), '"', $meta == $option['value'] ? ' checked="checked"' : '', ' ' . esc_attr($default_check) . ' /></div>';
                    echo '</div>';
                }
                echo '</div>';
                echo '<br class="clear_nfw"><br><p>' . __( 'Select if the page should have a sidebar and how it should be positioned', 'firstone_domain' ) . '</p>';
                break;
            case 'select':
                echo '<div>';
                echo '<select name="', esc_attr( $field['id'] ), '" id="', sanitize_html_class( $field['id'] ), '">';
                foreach( $field['options'] as $option ){
                    echo '<option ', $meta == $option ? ' selected="selected"' : '', '>', esc_html( $option ), '</option>';
                }
                echo '</select>';
                echo '</div>';
                echo '<br class="clear_nfw"><p>' . __( 'Select the sidebar that should be used. You can create additional sidebars in the theme options panel', 'firstone_domain' ) . '</p>';
                break;
        }
        echo '</td><td>',
        '</td></tr>';
    }
    echo '</table>';
}

add_action( 'save_post', 'nfw_save_sidebar_data' );

// Save data from meta box
function nfw_save_sidebar_data( $post_id ){
    global $meta_box;
    if( isset( $_POST['nfw_sidebar_meta_box_nonce'] ) ){
        // Verify nonce
        if( !wp_verify_nonce( $_POST['nfw_sidebar_meta_box_nonce'], basename( __FILE__ ) ) ){
            return $post_id;
        }
        // Check autosave
        if( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE ){
            return $post_id;
        }
        // Check permissions
        if( 'page' == $_POST['post_type'] ){
            if( !current_user_can( 'edit_page', $post_id ) ){
                return $post_id;
            }
        } elseif( !current_user_can( 'edit_post', $post_id ) ){
            return $post_id;
        }
        // Populates the meta box fields with the appropriate data
        foreach( $meta_box['fields'] as $field ){
            $old = get_post_meta( $post_id, $field['id'], true );
            $new = $_POST[$field['id']];
            if( $new && $new != $old ){
                update_post_meta( absint( $post_id ), sanitize_text_field( $field['id'] ), sanitize_text_field( $new ) );
            } elseif( '' == $new && $old ){
                delete_post_meta( absint( $post_id ), sanitize_text_field( $field['id'] ), sanitize_text_field( $old ) );
            }
        }
    }
}

// Check autosave
if( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE ){
    return $post_id;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       END OF THEME OPTIONS FRAMEWORK
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////