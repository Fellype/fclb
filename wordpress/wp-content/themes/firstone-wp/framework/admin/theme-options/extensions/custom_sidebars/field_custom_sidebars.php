<?php
/**
 * Redux Framework is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * any later version.
 *
 * Redux Framework is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Redux Framework. If not, see <http://www.gnu.org/licenses/>.
 *
 * @package     ReduxFramework
 * @author      Dovy Paukstys
 * @version     3.1.5
 */
// Exit if accessed directly
if( !defined( 'ABSPATH' ) )
    exit;

// Don't duplicate me!
if( !class_exists( 'ReduxFramework_custom_sidebars' ) ){

    /**
     * Main ReduxFramework_custom_sidebars class
     *
     * @since       1.0.0
     */
    class ReduxFramework_custom_sidebars extends ReduxFramework {

        /**
         * Field Constructor.
         *
         * Required - must call the parent constructor, then assign field and value to vars, and obviously call the render field function
         *
         * @since       1.0.0
         * @access      public
         * @return      void
         */
        function __construct( $field = array(), $value = '', $parent ){


            $this->parent = $parent;
            $this->field = $field;
            $this->value = $value;
            // $this->value_title = $value_title;
            // $this->value_description = $value_description;

            if( empty( $this->extension_dir ) ){
                $this->extension_dir = trailingslashit( str_replace( '\\', '/', dirname( __FILE__ ) ) );
                $this->extension_url = site_url( str_replace( trailingslashit( str_replace( '\\', '/', ABSPATH ) ), '', $this->extension_dir ) );
            }

            // Set default args for this field to avoid bad indexes. Change this to anything you use.
            $defaults = array(
                'options' => array(),
                'stylesheet' => '',
                'output' => true,
                'enqueue' => true,
                'enqueue_frontend' => true
            );
            $this->field = wp_parse_args( $this->field, $defaults );
        }

        /**
         * Field Render Function.
         *
         * Takes the vars and outputs the HTML for the field in the settings
         *
         * @since       1.0.0
         * @access      public
         * @return      void
         */
        public function render(){
            $this->add_text = ( isset( $this->field['add_text'] ) ) ? $this->field['add_text'] : __( 'Add new sidebar', 'firstone_domain' );
            $this->show_empty = ( isset( $this->field['show_empty'] ) ) ? $this->field['show_empty'] : true;

            $page_ids = get_all_page_ids();

            echo '<ul id="' . sanitize_html_class( $this->field['id'] ) . '-ul" class="redux-multi-text">';

            if( isset( $this->value ) && is_array( $this->value ) ){
                $values = $this->value;
                $count = count( $values );

                for( $k = 0; $k < $count; $k = $k + 2 ){
                    if( $values[$k] != '' ){
                        $i = $k + 1;

                        echo '<li><br><br>';
                        echo __( 'Sidebar Title:', 'firstone_domain' );
                        echo '<input type="text" id="' . sanitize_html_class( $this->field['id'] ) . '-' . $k . '" name="'
                        . esc_attr( $this->field['name'] ) . '[]' . esc_attr( $this->field['name_suffix'] ) . '" value="'
                        . esc_attr( $values[$k] ) . '" class="regular-text ' . esc_attr( $this->field['class'] ) . '" /><br>';
                        echo 'Description : <input type="text" id="' . sanitize_html_class( $this->field['id'] ) . '-' . $i . '" name="'
                        . esc_attr( $this->field['name'] ) . '[]' . esc_attr( $this->field['name_suffix'] ) . '" value="'
                        . esc_attr( $values[$k + 1] ) . '" class="regular-text ' . esc_attr( $this->field['class'] ) . '" />';
                        $verifiy = 0;

                        foreach( $page_ids as $id ){
                            $sidebar_title = get_post_meta( $id, 'wpx_sidebar_source', true );
                            if( $sidebar_title == $values[$k] ){
                                $verifiy++;
                            }
                        }
                        if( $verifiy == 0 ){
                            echo '<br><a href="javascript:void(0);" class="deletion redux-multi-text-remove"><img src="'
                            . get_template_directory_uri() . '/framework/admin/images/icons/delete-sidebar.png" title="' . __( 'Remove this sidebar', 'firstone_domain' ) . '" alt="' . __( 'Remove this sidebar', 'firstone_domain' ) . '"></a></li>';
                        } else{
                            ?>
                            <br><a href="javascript:void(0);" onClick='alert("<?php echo __( 'Not possible, this sidebar is used on a page!', 'firstone_domain' ); ?>")' ><?php
                                echo '<img src="'
                                . get_template_directory_uri() . '/framework/admin/images/icons/delete-sidebar.png" title="' . __( 'Remove this sidebar', 'firstone_domain' ) . '" alt="' . __( 'Remove this sidebar', 'firstone_domain' ) . '">'
                                ?> </a></li>
                            <?php
                        }
                    }
                }
            } elseif( $this->show_empty == true ){
                echo '<li><br><br>' . __( 'Sidebar Title:', 'firstone_domain' ) . '<input type="text" id="' . sanitize_html_class( $this->field['id'] ) . '" name="'
                . esc_attr( $this->field['name'] ) . '[]' . esc_attr( $this->field['name_suffix'] ) . '" value="" class="regular-text '
                . esc_attr( $this->field['class'] ) . '" /><br>'
                . __( 'Description : ', 'firstone_domain' ) . '<input type="text" id="' . esc_attr( $this->field['id'] ) . '" name="' . esc_attr( $this->field['name'] ) . '[]'
                . esc_attr( $this->field['name_suffix'] ) . '" value="" class="regular-text ' . esc_attr( $this->field['class'] ) . '" />'
                . '<br><a href="javascript:void(0);" class="deletion redux-multi-text-remove"> <img src="'
                . get_template_directory_uri() . '/framework/admin/images/icons/delete-sidebar.png" > </a></li>';
            }

            echo '<li style="display:none;"><br><br>' . __( 'Sidebar Title:', 'firstone_domain' ) . '<input type="text" id="' . sanitize_html_class( $this->field['id'] ) . '" name="" value="" class="regular-text" /><br>'
            . __( 'Description : ', 'firstone_domain' ) . '<input type="text" id="' . esc_attr( $this->field['id'] ) . '" name="" value="" class="regular-text" />'
            . '<br><a href="javascript:void(0);" class="deletion redux-multi-text-remove"><img src="'
            . get_template_directory_uri() . '/framework/admin/images/icons/delete-sidebar.png" ></a></li>';

            echo '</ul>';
            $this->field['add_number'] = ( isset( $this->field['add_number'] ) && is_numeric( $this->field['add_number'] ) ) ? $this->field['add_number'] : 1;
            echo '<a href="javascript:void(0);" class="button button-primary redux-multi-text-add" data-add_number="'
            . esc_attr( $this->field['add_number'] ) . '" data-id="' . esc_attr( $this->field['id'] ) . '-ul" data-name="'
            . esc_attr( $this->field['name'] ) . '[]">' . esc_attr( $this->add_text ) . '</a><br/>';
        }

        /**
         * Enqueue Function.
         *
         * If this field requires any scripts, or css define this function and register/enqueue the scripts/css
         *
         * @since       1.0.0
         * @access      public
         * @return      void
         */
        public function enqueue(){

            wp_enqueue_script(
                    'redux-field-multi-text-js', ReduxFramework::$_url . 'inc/fields/multi_text/field_multi_text' . Redux_Functions::isMin() . '.js', array('jquery'), time(), true
            );

            wp_enqueue_style(
                    'redux-field-multi-text-css', ReduxFramework::$_url . 'inc/fields/multi_text/field_multi_text.css', time(), true
            );
        }

        /**
         * Output Function.
         *
         * Used to enqueue to the front-end
         *
         * @since       1.0.0
         * @access      public
         * @return      void
         */
        public function output(){

            if( $this->field['enqueue_frontend'] ){
                
            }
        }

    }

}