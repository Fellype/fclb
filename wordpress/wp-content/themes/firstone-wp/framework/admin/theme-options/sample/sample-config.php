<?php
/**
  ReduxFramework Sample Config File
  For full documentation, please visit: https://docs.reduxframework.com
 * */
if( !class_exists( 'Redux_Framework_sample_config' ) ){

    class Redux_Framework_sample_config {

        public $args = array();
        public $sections = array();
        public $theme;
        public $ReduxFramework;

        public function __construct(){

            if( !class_exists( 'ReduxFramework' ) ){
                return;
            }

            // This is needed. Bah WordPress bugs.  ;)
            if( true == Redux_Helpers::isTheme( __FILE__ ) ){
                $this->initSettings();
            } else{
                add_action( 'plugins_loaded', array($this, 'initSettings'), 10 );
            }
        }

        public function initSettings(){

            // Just for demo purposes. Not needed per say.
            $this->theme = wp_get_theme();

            // Set the default arguments
            $this->setArguments();

            // Set a few help tabs so you can see how it's done
            //$this->setHelpTabs();
            // Create the sections and fields
            $this->setSections();

            if( !isset( $this->args['opt_name'] ) ){ // No errors please
                return;
            }

            // If Redux is running as a plugin, this will remove the demo notice and links
            //add_action( 'redux/loaded', array( $this, 'remove_demo' ) );
            // Function to test the compiler hook and demo CSS output.
            // Above 10 is a priority, but 2 in necessary to include the dynamically generated CSS to be sent to the function.
            //add_filter('redux/options/'.$this->args['opt_name'].'/compiler', array( $this, 'compiler_action' ), 10, 3);
            // Change the arguments after they've been declared, but before the panel is created
            //add_filter('redux/options/'.$this->args['opt_name'].'/args', array( $this, 'change_arguments' ) );
            // Change the default value of a field after it's been set, but before it's been useds
            //add_filter('redux/options/'.$this->args['opt_name'].'/defaults', array( $this,'change_defaults' ) );
            // Dynamically add a section. Can be also used to modify sections/fields
            //add_filter('redux/options/' . $this->args['opt_name'] . '/sections', array($this, 'dynamic_section'));

            $this->ReduxFramework = new ReduxFramework( $this->sections, $this->args );
        }

        /**

          This is a test function that will let you see when the compiler hook occurs.
          It only runs if a field	set with compiler=>true is changed.

         * */
        function compiler_action( $options, $css, $changed_values ){
            echo '<h1>The compiler hook has run!</h1>';
            echo "<pre>";
            print_r( $changed_values ); // Values that have changed since the last save
            echo "</pre>";
            //print_r($options); //Option values
            //print_r($css); // Compiler selector CSS values  compiler => array( CSS SELECTORS )

            /*
              // Demo of how to use the dynamic CSS and write your own static CSS file
              $filename = dirname(__FILE__) . '/style' . '.css';
              global $wp_filesystem;
              if( empty( $wp_filesystem ) ) {
              require_once( ABSPATH .'/wp-admin/includes/file.php' );
              WP_Filesystem();
              }

              if( $wp_filesystem ) {
              $wp_filesystem->put_contents(
              $filename,
              $css,
              FS_CHMOD_FILE // predefined mode settings for WP files
              );
              }
             */
        }

        /**

          Custom function for filtering the sections array. Good for child themes to override or add to the sections.
          Simply include this function in the child themes functions.php file.

          NOTE: the defined constants for URLs, and directories will NOT be available at this point in a child theme,
          so you must use get_template_directory_uri() if you want to use any of the built in icons

         * */
        function dynamic_section( $sections ){
            //$sections = array();
            $sections[] = array(
                'title' => __( 'Section via hook', 'firstone_domain' ),
                'desc' => __( '<p class="description">This is a section created by adding a filter to the sections array. Can be used by child themes to add/remove sections from the options.</p>', 'firstone_domain' ),
                'icon' => 'el-icon-paper-clip',
                // Leave this as a blank section, no options just some intro text set above.
                'fields' => array()
            );

            return $sections;
        }

        /**

          Filter hook for filtering the args. Good for child themes to override or add to the args array. Can also be used in other functions.

         * */
        function change_arguments( $args ){
            //$args['dev_mode'] = true;

            return $args;
        }

        /**

          Filter hook for filtering the default value of any given field. Very useful in development mode.

         * */
        function change_defaults( $defaults ){
            $defaults['str_replace'] = 'Testing filter hook!';

            return $defaults;
        }

        // Remove the demo link and the notice of integrated demo from the redux-framework plugin
        function remove_demo(){

            // Used to hide the demo mode link from the plugin page. Only used when Redux is a plugin.
            if( class_exists( 'ReduxFrameworkPlugin' ) ){
                remove_filter( 'plugin_row_meta', array(ReduxFrameworkPlugin::instance(), 'plugin_metalinks'), null, 2 );

                // Used to hide the activation notice informing users of the demo panel. Only used when Redux is a plugin.
                remove_action( 'admin_notices', array(ReduxFrameworkPlugin::instance(), 'admin_notices') );
            }
        }

        public function setSections(){
            /**
              Used within different fields. Simply examples. Search for ACTUAL DECLARATION for field examples
             * */
            // Background Patterns Reader
            $sample_patterns_path = ReduxFramework::$_dir . '../sample/patterns/';
            $sample_patterns_url = ReduxFramework::$_url . '../sample/patterns/';
            $sample_patterns = array();

            if( is_dir( $sample_patterns_path ) ) :

                if( $sample_patterns_dir = opendir( $sample_patterns_path ) ) :
                    $sample_patterns = array();

                    while( ( $sample_patterns_file = readdir( $sample_patterns_dir ) ) !== false ){

                        if( stristr( $sample_patterns_file, '.png' ) !== false || stristr( $sample_patterns_file, '.jpg' ) !== false ){
                            $name = explode( '.', $sample_patterns_file );
                            $name = str_replace( '.' . end( $name ), '', $sample_patterns_file );
                            $sample_patterns[] = array('alt' => $name, 'img' => $sample_patterns_url . $sample_patterns_file);
                        }
                    }
                endif;
            endif;

            ob_start();

            $ct = wp_get_theme();
            $this->theme = $ct;
            $item_name = $this->theme->get( 'Name' );
            $tags = $this->theme->Tags;
            $screenshot = $this->theme->get_screenshot();
            $class = $screenshot ? 'has-screenshot' : '';

            $customize_title = sprintf( __( 'Customize &#8220;%s&#8221;', 'firstone_domain' ), $this->theme->display( 'Name' ) );
            ?>
            <div id="current-theme" class="<?php echo sanitize_html_class( $class ); ?>">
                <?php if( $screenshot ) : ?>
                    <?php if( current_user_can( 'edit_theme_options' ) ) : ?>
                        <a href="<?php echo wp_customize_url(); ?>" class="load-customize hide-if-no-customize" title="<?php echo esc_attr( $customize_title ); ?>">
                            <img src="<?php echo esc_url( $screenshot ); ?>" alt="<?php echo esc_attr( 'Current theme preview', 'firstone_domain' ); ?>" />
                        </a>
                    <?php endif; ?>
                    <img class="hide-if-customize" src="<?php echo esc_url( $screenshot ); ?>" alt="<?php echo esc_attr( 'Current theme preview', 'firstone_domain' ); ?>" />
                <?php endif; ?>

                <h4><?php echo esc_html( $this->theme->display( 'Name' ) ); ?></h4>

                <div>
                    <ul class="theme-info">
                        <li><?php echo __( 'By ', 'firstone_domain' ) . esc_html( $this->theme->display( 'Author' ) ); ?></li>
                        <li><?php echo __( 'Version ', 'firstone_domain' ) . esc_html( $this->theme->display( 'Version' ) ); ?></li>
                        <li><?php echo '<strong>' . __( 'Tags', 'firstone_domain' ) . ':</strong> '; ?><?php printf( $this->theme->display( 'Tags' ) ); ?></li>
                    </ul>
                    <p class="theme-description"><?php echo esc_html( $this->theme->display( 'Description' ) ); ?></p>
                    <?php
                    if( $this->theme->parent() ){
                        printf( ' <p class="howto">' . __( 'This <a href="%1$s">child theme</a> requires its parent theme, %2$s.', 'firstone_domain' ) . '</p>', __( 'http://codex.wordpress.org/Child_Themes', 'firstone_domain' ), esc_html( $this->theme->parent()->display( 'Name' ) ) );
                    }
                    ?>

                </div>
            </div>

            <?php
            $item_info = ob_get_contents();

            ob_end_clean();

            $sampleHTML = '';
            if( file_exists( dirname( __FILE__ ) . '/info-html.html' ) ){
                /** @global WP_Filesystem_Direct $wp_filesystem  */
                global $wp_filesystem;
                if( empty( $wp_filesystem ) ){
                    require_once(ABSPATH . '/wp-admin/includes/file.php');
                    WP_Filesystem();
                }
                $sampleHTML = $wp_filesystem->get_contents( dirname( __FILE__ ) . '/info-html.html' );
            }

            // Generates the options aray of pages for 404 selection
            $page_ids = get_all_page_ids();
            $pages_array = array();
            $pages_array['default'] = 'Default 404';
            foreach( $page_ids as $page_id ){
                // do not include the Auto Draft pages
                if( get_the_title( $page_id ) != 'Auto Draft' ){
                    $pages_array[$page_id] = esc_html( get_the_title( $page_id ) );
                }
            }

            // ACTUAL DECLARATION OF SECTIONS                
            // General tab
            $this->sections[] = array(
                'icon' => 'el-icon-cogs',
                'title' => __( 'General', 'firstone_domain' ),
                'subsection' => false,
                'fields' => array(
                    array(
                        'id' => 'nfw-favicon-selector',
                        'type' => 'media',
                        'url' => true,
                        'title' => __( 'FavIcon Selection', 'firstone_domain' ),
                        'desc' => __( 'Upload a new icon image', 'firstone_domain' ),
                        'subtitle' => __( 'Replace or remove the existing icon', 'firstone_domain' ),
                        'default' => array(
                            'url' => get_template_directory_uri() . '/layout/images/default/favicon.png')
                    ),
                    array(
                        'id' => 'nfw-appleicon-selector',
                        'type' => 'media',
                        'url' => true,
                        'title' => __( 'Apple Icon Selection', 'firstone_domain' ),
                        'desc' => __( 'Upload a new icon image', 'firstone_domain' ),
                        'subtitle' => __( 'Replace or remove the existing icon', 'firstone_domain' ),
                        'default' => array(
                            'url' => get_template_directory_uri() . '/layout/images/default/apple-touch-icon-144-precomposed.png')
                    ),
                    array(
                        'id' => 'nfw-backtotop-toggle',
                        'type' => 'button_set',
                        'title' => __( 'Back to top', 'firstone_domain' ),
                        'subtitle' => __( 'Show the back to top element', 'firstone_domain' ),
                        'desc' => __( 'Toggle On or Off', 'firstone_domain' ),
                        'options' => array(
                            '1' => 'On',
                            '2' => 'Off'
                        ),
                        'default' => '1'
                    ),
                    array(
                        'id' => 'nfw-preloader-image',
                        'type' => 'media',
                        'url' => true,
                        'title' => __( 'Preloader image', 'firstone_domain' ),
                        'desc' => __( 'Upload a new image', 'firstone_domain' ),
                        'subtitle' => __( 'Replace or remove the existing image', 'firstone_domain' ),
                        'default' => array(
                            'url' => get_template_directory_uri() . '/layout/images/loader.gif')
                    ),
                    array(
                        'id' => 'nfw-404-selection',
                        'type' => 'select',
                        'title' => __( '404 Page Selection', 'firstone_domain' ),
                        'subtitle' => __( 'Can replace the page displayed when error 404 occurs', 'firstone_domain' ),
                        'desc' => __( 'Chose a page for 404 error', 'firstone_domain' ),
                        'options' => $pages_array,
                        'default' => 'default',
                    ),
                    array(
                        'id' => 'nfw-custom-css',
                        'type' => 'textarea',
                        'title' => __( 'Custom CSS', 'firstone_domain' ),
                        'subtitle' => __( 'Only CSS code allowed', 'firstone_domain' ),
                        'desc' => __( 'This field is CSS validated.', 'firstone_domain' ),
                        'validate' => 'css',
                    ),
                    array(
                        'id' => 'nfw-custom-analytics',
                        'type' => 'textarea',
                        'title' => __( 'Analytics', 'firstone_domain' ),
                        'subtitle' => __( 'Field for Analytics Javascript code', 'firstone_domain' ),
                        'desc' => __( 'Insert the Javascript code.', 'firstone_domain' ),
                    //'validate' => 'js',
                    )
                )
            );

            // Header tab
            $this->sections[] = array(
                'icon' => 'el-icon-home',
                'title' => __( 'Header', 'firstone_domain' ),
                'subsection' => false,
                'fields' => array(
                    array(
                        'id' => 'nfw-header-logo',
                        'type' => 'media',
                        'url' => true,
                        'title' => __( 'Header Logo Selection', 'firstone_domain' ),
                        'desc' => __( 'Upload a new logo image', 'firstone_domain' ),
                        'subtitle' => __( 'Replace or remove the existing logo', 'firstone_domain' ),
                        'default' => array(
                            'url' => get_template_directory_uri() . '/layout/images/logo.png')
                    ),
                    array(
                        'id' => 'nfw-header-sticky-logo',
                        'type' => 'media',
                        'url' => true,
                        'title' => __( 'Sticky Header Logo Selection', 'firstone_domain' ),
                        'desc' => __( 'Upload a new logo image', 'firstone_domain' ),
                        'subtitle' => __( 'Replace or remove the existing logo', 'firstone_domain' ),
                        'default' => array(
                            'url' => get_template_directory_uri() . '/layout/images/logo-dark.png')
                    ),
                    array(
                        'id' => 'nfw-header-background-image',
                        'type' => 'media',
                        'url' => true,
                        'title' => __( 'Header background image', 'firstone_domain' ),
                        'desc' => __( 'Upload a new image', 'firstone_domain' ),
                        'subtitle' => __( 'Replace or remove the existing image', 'firstone_domain' ),
                        'default' => array(
                            'url' => get_template_directory_uri() . '/layout/images/bg-page-header.jpg')
                    )
                )
            );

            // Footer tab
            $this->sections[] = array(
                'icon' => 'el-icon-credit-card',
                'title' => __( 'Footer', 'firstone_domain' ),
                'subsection' => false,
                'fields' => array(
                    array(
                        'id' => 'nfw-footer-top-switch',
                        'type' => 'button_set',
                        'title' => __( 'Footer', 'firstone_domain' ),
                        'subtitle' => __( 'Enable or disable footer area', 'firstone_domain' ),
                        'desc' => __( 'Enable or disable footer area', 'firstone_domain' ),
                        'options' => array(
                            '1' => 'Enable',
                            '2' => 'Disable'
                        ),
                        'default' => '1'
                    ),
                    array(
                        'id' => 'nfw-footer-top-layout',
                        'type' => 'image_select',
                        'required' => array('nfw-footer-top-switch', 'equals', '1'),
                        'title' => __( 'Footer Layout', 'firstone_domain' ),
                        'subtitle' => __( 'Select the number of widgetable areas', 'firstone_domain' ),
                        'options' => array(
                            '1' => array(
                                'alt' => '1 Area',
                                'title' => '1',
                                'img' => get_template_directory_uri() . '/framework/admin/images/icons/l1.png'
                            ),
                            '2' => array(
                                'alt' => '2 Areas',
                                'title' => '2',
                                'img' => get_template_directory_uri() . '/framework/admin/images/icons/l2.png'
                            ),
                            '3' => array(
                                'alt' => '3 Areas',
                                'title' => '3',
                                'img' => get_template_directory_uri() . '/framework/admin/images/icons/l3.png'
                            ),
                            '4' => array(
                                'alt' => '4 Areas',
                                'title' => '4',
                                'img' => get_template_directory_uri() . '/framework/admin/images/icons/l4.png'
                            )
                        ),
                        'default' => '2'
                    )
                )
            );

            // Color Schemes tab
            $this->sections[] = array(
                'icon' => 'el-icon-list',
                'title' => __( 'Color Schemes', 'firstone_domain' ),
                'subsection' => false,
                'fields' => array(
                    array(
                        'id' => 'nfw-accent-colors-enable',
                        'type' => 'button_set',
                        'title' => __( 'Color scheme', 'firstone_domain' ),
                        'subtitle' => __( 'Enable or disable custom color scheme', 'firstone_domain' ),
                        'desc' => __( 'If it is disabled, then the default color scheme will be used.', 'firstone_domain' ),
                        'options' => array(
                            '1' => 'Enable',
                            '2' => 'Disable'
                        ),
                        'default' => '2'
                    ),
                    array(
                        'id' => 'nfw-color-scheme-accent',
                        'type' => 'color',
                        'required' => array('nfw-accent-colors-enable', 'equals', '1'),
                        'title' => __( 'Accent color', 'firstone_domain' ),
                        'subtitle' => __( 'Pick an accent color', 'firstone_domain' ),
                        'default' => '#ffb400',
                        'transparent' => false,
                        'validate' => 'color',
                    ),
                    array(
                        'id' => 'nfw-color-scheme-accent-alt',
                        'type' => 'color',
                        'required' => array('nfw-accent-colors-enable', 'equals', '1'),
                        'title' => __( 'Accent alt color', 'firstone_domain' ),
                        'subtitle' => __( 'Pick an alt accent color', 'firstone_domain' ),
                        'default' => '#bebebe',
                        'transparent' => false,
                        'validate' => 'color',
                    ),
                    array(
                        'id' => 'nfw-color-scheme-font',
                        'type' => 'color',
                        'required' => array('nfw-accent-colors-enable', 'equals', '1'),
                        'title' => __( 'Font color', 'firstone_domain' ),
                        'subtitle' => __( 'Pick a font color', 'firstone_domain' ),
                        'default' => '#4b4b4b',
                        'transparent' => false,
                        'validate' => 'color',
                    ),
                    array(
                        'id' => 'nfw-color-scheme-headline',
                        'type' => 'color',
                        'required' => array('nfw-accent-colors-enable', 'equals', '1'),
                        'title' => __( 'Headline color', 'firstone_domain' ),
                        'subtitle' => __( 'Pick a headline color', 'firstone_domain' ),
                        'default' => '#4b4b4b',
                        'transparent' => false,
                        'validate' => 'color',
                    ),
                    array(
                        'id' => 'nfw-color-menu',
                        'type' => 'color',
                        'required' => array('nfw-accent-colors-enable', 'equals', '1'),
                        'title' => __( 'Menu color', 'firstone_domain' ),
                        'subtitle' => __( 'Pick a font color', 'firstone_domain' ),
                        'default' => '#ffffff',
                        'transparent' => false,
                        'validate' => 'color',
                    ),
                    array(
                        'id' => 'nfw-color-sticky-menu',
                        'type' => 'color',
                        'required' => array('nfw-accent-colors-enable', 'equals', '1'),
                        'title' => __( 'Sticky menu background color', 'firstone_domain' ),
                        'subtitle' => __( 'Pick a font color', 'firstone_domain' ),
                        'default' => '#fff',
                        'transparent' => false,
                        'validate' => 'color',
                    ),
                    array(
                        'id' => 'nfw-color-sticky-color',
                        'type' => 'color',
                        'required' => array('nfw-accent-colors-enable', 'equals', '1'),
                        'title' => __( 'Sticky menu font color', 'firstone_domain' ),
                        'subtitle' => __( 'Pick a font color', 'firstone_domain' ),
                        'default' => '#4b4b4b',
                        'transparent' => false,
                        'validate' => 'color',
                    ),
                    array(
                        'id' => 'nfw-color-scheme-footer-background',
                        'type' => 'color',
                        'required' => array('nfw-accent-colors-enable', 'equals', '1'),
                        'title' => __( 'Footer background color', 'firstone_domain' ),
                        'subtitle' => __( 'Pick a footer background color', 'firstone_domain' ),
                        'default' => '#1b1b1b',
                        'transparent' => false,
                        'validate' => 'color',
                    ),
                    array(
                        'id' => 'nfw-color-scheme-footer-font',
                        'type' => 'color',
                        'required' => array('nfw-accent-colors-enable', 'equals', '1'),
                        'title' => __( 'Footer font color', 'firstone_domain' ),
                        'subtitle' => __( 'Pick a footer font color', 'firstone_domain' ),
                        'default' => '#ffffff',
                        'transparent' => false,
                        'validate' => 'color',
                    )
                )
            );

            // Sidebar selection tab
            $this->sections[] = array(
                'icon' => 'el-icon-website',
                'title' => __( 'Sidebars', 'firstone_domain' ),
                'subsection' => false,
                'fields' => array(
                    array(
                        'id' => 'nfw-sidebars-custom',
                        'type' => 'custom_sidebars',
                        'title' => __( 'Add/remove multiple sidebars', 'firstone_domain' ),
                        'validate' => 'no_html',
                        'subtitle' => __( 'Add/edit sidebars', 'firstone_domain' ),
                        'desc' => __( 'No html allowed.', 'firstone_domain' )
                    )
                )
            );

            $theme_info = '<div class="redux-framework-section-desc">';
            $theme_info .= '<p class="redux-framework-theme-data description theme-uri"><strong>' . __( 'Theme URL:', 'firstone_domain' ) . '</strong> <a href="' . esc_url( $this->theme->get( 'ThemeURI' ) ) . '" target="_blank">' . esc_url( $this->theme->get( 'ThemeURI' ) ) . '</a></p>';
            $theme_info .= '<p class="redux-framework-theme-data description theme-author"><strong>' . __( 'Author:', 'firstone_domain' ) . '</strong> ' . esc_html( $this->theme->get( 'Author' ) ) . '</p>';
            $theme_info .= '<p class="redux-framework-theme-data description theme-version"><strong>' . __( 'Version:', 'firstone_domain' ) . '</strong> ' . esc_html( $this->theme->get( 'Version' ) ) . '</p>';
            $theme_info .= '<p class="redux-framework-theme-data description theme-description">' . esc_html( $this->theme->get( 'Description' ) ) . '</p>';
            $tabs = $this->theme->get( 'Tags' );
            if( !empty( $tabs ) ){
                $theme_info .= '<p class="redux-framework-theme-data description theme-tags"><strong>' . __( 'Tags:', 'firstone_domain' ) . '</strong> ' . implode( ', ', $tabs ) . '</p>';
            }
            $theme_info .= '</div>';

            $this->sections[] = array(
                'title' => __( 'Import / Export', 'firstone_domain' ),
                'desc' => __( 'Import and Export your Redux Framework settings from file, text or URL.', 'firstone_domain' ),
                'icon' => 'el-icon-refresh',
                'fields' => array(
                    array(
                        'id' => 'opt-import-export',
                        'type' => 'import_export',
                        'title' => 'Import Export',
                        'subtitle' => 'Save and restore your Redux options',
                        'full_width' => false,
                    ),
                ),
            );
        }

        public function setHelpTabs(){

            // Custom page help tabs, displayed using the help API. Tabs are shown in order of definition.
            $this->args['help_tabs'][] = array(
                'id' => 'redux-help-tab-1',
                'title' => __( 'Theme Information 1', 'firstone_domain' ),
                'content' => __( '<p>This is the tab content, HTML is allowed.</p>', 'firstone_domain' )
            );

            $this->args['help_tabs'][] = array(
                'id' => 'redux-help-tab-2',
                'title' => __( 'Theme Information 2', 'firstone_domain' ),
                'content' => __( '<p>This is the tab content, HTML is allowed.</p>', 'firstone_domain' )
            );

            // Set the help sidebar
            $this->args['help_sidebar'] = __( '<p>This is the sidebar content, HTML is allowed.</p>', 'firstone_domain' );
        }

        /**

          All the possible arguments for Redux.
          For full documentation on arguments, please refer to: https://github.com/ReduxFramework/ReduxFramework/wiki/Arguments

         * */
        public function setArguments(){

            $theme = wp_get_theme(); // For use with some settings. Not necessary.

            $this->args = array(
                // TYPICAL -> Change these values as you need/desire
                'opt_name' => 'nfw_theme_options', // This is where your data is stored in the database and also becomes your global variable name.
                'display_name' => esc_html( $theme->get( 'Name' ) ), // Name that appears at the top of your panel
                'display_version' => esc_html( $theme->get( 'Version' ) ), // Version that appears at the top of your panel
                'menu_type' => 'menu', //Specify if the admin menu should appear or not. Options: menu or submenu (Under appearance only)
                'allow_sub_menu' => true, // Show the sections below the admin menu item or not
                'menu_title' => __( 'Theme Options', 'firstone_domain' ),
                'page_title' => __( 'Theme Options', 'firstone_domain' ),
                // You will need to generate a Google API key to use this feature.
                // Please visit: https://developers.google.com/fonts/docs/developer_api#Auth
                'google_api_key' => '', // Must be defined to add google fonts to the typography module
                'async_typography' => false, // Use a asynchronous font on the front end or font string
                'admin_bar' => true, // Show the panel pages on the admin bar
                'global_variable' => '', // Set a different name for your global variable other than the opt_name
                'dev_mode' => false, // Show the time the page took to load, etc
                'customizer' => true, // Enable basic customizer support
                //'open_expanded'     => true,                    // Allow you to start the panel in an expanded way initially.
                //'disable_save_warn' => true,                    // Disable the save warning when a user changes a field
                // OPTIONAL -> Give you extra features
                'page_priority' => '57', // Order where the menu appears in the admin area. If there is any conflict, something will not show. Warning.
                'page_parent' => 'themes.php', // For a full list of options, visit: http://codex.wordpress.org/Function_Reference/add_submenu_page#Parameters
                'page_permissions' => 'manage_options', // Permissions needed to access the options panel.
                'menu_icon' => get_template_directory_uri() . '/framework/admin/images/icons/theme_options_admin_icon.png', // Specify a custom URL to an icon
                'last_tab' => '', // Force your panel to always open to a specific tab (by id)
                'page_icon' => 'icon-themes', // Icon displayed in the admin panel next to your menu_title
                'page_slug' => '_options', // Page slug used to denote the panel
                'save_defaults' => true, // On load save the defaults to DB before user clicks save or not
                'default_show' => false, // If true, shows the default value next to each field that is not the default value.
                'default_mark' => '', // What to print by the field's title if the value shown is default. Suggested: *
                'show_import_export' => true, // Shows the Import/Export panel when not used as a field.
                // CAREFUL -> These options are for advanced use only
                'transient_time' => 60 * MINUTE_IN_SECONDS,
                'output' => true, // Global shut-off for dynamic CSS output by the framework. Will also disable google fonts output
                'output_tag' => true, // Allows dynamic CSS to be generated for customizer and google fonts, but stops the dynamic CSS from going to the head
                // 'footer_credit'     => '',                   // Disable the footer credit of Redux. Please leave if you can help it.
                // FUTURE -> Not in use yet, but reserved or partially implemented. Use at your own risk.
                'database' => '', // possible: options, theme_mods, theme_mods_expanded, transient. Not fully functional, warning!
                'system_info' => false, // REMOVE
                // HINTS
                'hints' => array(
                    'icon' => 'icon-question-sign',
                    'icon_position' => 'right',
                    'icon_color' => 'lightgray',
                    'icon_size' => 'normal',
                    'tip_style' => array(
                        'color' => 'light',
                        'shadow' => true,
                        'rounded' => false,
                        'style' => '',
                    ),
                    'tip_position' => array(
                        'my' => 'top left',
                        'at' => 'bottom right',
                    ),
                    'tip_effect' => array(
                        'show' => array(
                            'effect' => 'slide',
                            'duration' => '500',
                            'event' => 'mouseover',
                        ),
                        'hide' => array(
                            'effect' => 'slide',
                            'duration' => '500',
                            'event' => 'click mouseleave',
                        ),
                    ),
                )
            );


            // SOCIAL ICONS -> Setup custom links in the footer for quick links in your panel footer icons.
            /* $this->args['share_icons'][] = array(
              'url'   => 'https://github.com/ReduxFramework/ReduxFramework',
              'title' => 'Visit us on GitHub',
              'icon'  => 'el-icon-github'
              //'img'   => '', // You can use icon OR img. IMG needs to be a full URL.
              );
              $this->args['share_icons'][] = array(
              'url'   => 'https://www.facebook.com/pages/Redux-Framework/243141545850368',
              'title' => 'Like us on Facebook',
              'icon'  => 'el-icon-facebook'
              );
              $this->args['share_icons'][] = array(
              'url'   => 'http://twitter.com/reduxframework',
              'title' => 'Follow us on Twitter',
              'icon'  => 'el-icon-twitter'
              );
              $this->args['share_icons'][] = array(
              'url'   => 'http://www.linkedin.com/company/redux-framework',
              'title' => 'Find us on LinkedIn',
              'icon'  => 'el-icon-linkedin'
              ); */

            // Panel Intro text -> before the form
            if( !isset( $this->args['global_variable'] ) || $this->args['global_variable'] !== false ){
                if( !empty( $this->args['global_variable'] ) ){
                    $v = $this->args['global_variable'];
                } else{
                    $v = str_replace( '-', '_', $this->args['opt_name'] );
                }
                // $this->args['intro_text'] = sprintf(__('<p>Did you know that Redux sets a global variable for you? To access any of your saved options from within your code you can use your global variable: <strong>$%1$s</strong></p>', 'firstone_domain'), $v);
            } else{
                // $this->args['intro_text'] = __('<p>This text is displayed above the options panel. It isn\'t required, but more info is always better! The intro_text field accepts all HTML.</p>', 'firstone_domain');
            }

            // Add content after the form.
            //$this->args['footer_text'] = __('<p>This text is displayed below the options panel. It isn\'t required, but more info is always better! The footer_text field accepts all HTML.</p>', 'firstone_domain');
        }

    }

    global $reduxConfig;
    $reduxConfig = new Redux_Framework_sample_config();
}

/**
  Custom function for the callback referenced above
 */
if( !function_exists( 'redux_my_custom_field' ) ):

    function redux_my_custom_field( $field, $value ){
        print_r( $field );
        echo '<br/>';
        print_r( $value );
    }

endif;

/**
  Custom function for the callback validation referenced above
 * */
if( !function_exists( 'redux_validate_callback_function' ) ):

    function redux_validate_callback_function( $field, $value, $existing_value ){
        $error = false;
        $value = 'just testing';

        /*
          do your validation

          if(something) {
          $value = $value;
          } elseif(something else) {
          $error = true;
          $value = $existing_value;
          $field['msg'] = 'your custom error message';
          }
         */

        $return['value'] = $value;
        if( $error == true ){
            $return['error'] = $field;
        }
        return $return;
    }







endif;