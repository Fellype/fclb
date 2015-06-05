<?php

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       Contact Widget
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class nfw_contact_widget extends WP_Widget {

    function __construct(){
        parent::__construct(
                'nfw_contact_widget', __( 'FirstOne - Contact', 'firstone_domain' ), array(
            'description' => __( 'contact widget', 'firstone_domain' ),)
        );
    }

    public function widget( $args, $instance ){
        $title = apply_filters( 'widget_title', $instance['title'] );
        $email = apply_filters( 'widget_email', $instance['email'] );
        $address = apply_filters( 'widget_address', $instance['address'] );
        $phone = apply_filters( 'widget_phone', $instance['phone'] );

        echo wp_kses_post( $args['before_widget'] );
        ?>
        <div class="widget nfw_widget_contact_info">

            <?php
            if( trim( $title ) != '' ){
                echo wp_kses_post( $args['before_title'] );
                echo esc_html( $title );
                echo wp_kses_post( $args['after_title'] );
            }
            ?>

            <ul>
                <?php if( trim( $address ) != '' ): ?>
                    <li>
                        <i class="ifc-home"></i>
                        <?php
                        $address = esc_html( $address );
                        $address_parts = preg_split( "/\r\n|\n|\r/", $address );

                        foreach( $address_parts as $address_part ){
                            echo esc_html( $address_part ) . '<br>';
                        }
                        ?>
                    </li>
                    <?php
                endif;
                if( trim( $email ) != '' ):
                    ?>
                    <li>
                        <i class="ifc-message"></i>
                        <a href="mailto:<?php echo esc_attr( $email ); ?>">
                            <?php echo esc_html( $email ); ?></a>
                    </li>

                    <?php
                endif;
                if( trim( $phone ) != '' ):
                    ?>
                    <li>
                        <i class="ifc-phone1"></i>
                        <?php
                        echo esc_html( $phone );
                        ?><br>
                    </li>
                <?php endif; ?>
            </ul>

        </div>

        <?php
        echo wp_kses_post( $args['after_widget'] );
    }

    public function form( $instance ){
        if( isset( $instance['title'] ) ){
            $title = $instance['title'];
        } else{
            $title = '';
        }
        ?>
        <p>
            <label for="<?php echo sanitize_html_class( $this->get_field_id( 'title' ) ); ?>"><?php _e( 'Title:', 'firstone_domain' ); ?></label>
            <input class="widefat" 
                   id="<?php echo sanitize_html_class( $this->get_field_id( 'title' ) ); ?>" 
                   name="<?php echo esc_attr( $this->get_field_name( 'title' ) ); ?>" 
                   type="text" 
                   value="<?php echo esc_attr( $title ); ?>" />
        </p>

        <?php
        if( isset( $instance['address'] ) ){
            $address = $instance['address'];
        } else{
            $address = '';
        }
        ?>
        <p>
            <label for="<?php echo sanitize_html_class( $this->get_field_id( 'address' ) ); ?>"><?php _e( 'Address:', 'firstone_domain' ); ?></label>
            <textarea class="widefat" 
                      id="<?php echo sanitize_html_class( $this->get_field_id( 'address' ) ); ?>" 
                      name="<?php echo esc_attr( $this->get_field_name( 'address' ) ); ?>" ><?php echo esc_textarea( $address ); ?> </textarea>
        </p>

        <?php
        if( isset( $instance['phone'] ) ){
            $phone = $instance['phone'];
        } else{
            $phone = '';
        }
        ?>
        <p>
            <label for="<?php echo sanitize_html_class( $this->get_field_id( 'phone' ) ); ?>"><?php _e( 'Phone:', 'firstone_domain' ); ?></label>
            <input class="widefat" 
                   id="<?php echo sanitize_html_class( $this->get_field_id( 'phone' ) ); ?>" 
                   name="<?php echo esc_attr( $this->get_field_name( 'phone' ) ); ?>" 
                   type="text" 
                   value="<?php echo esc_attr( $phone ); ?>" />
        </p>

        <?php
        if( isset( $instance['email'] ) ){
            $email = $instance['email'];
        } else{
            $email = '';
        }
        ?>

        <p>
            <label for="<?php echo sanitize_html_class( $this->get_field_id( 'email' ) ); ?>"><?php _e( 'Email:', 'firstone_domain' ); ?></label>
            <input class="widefat" 
                   id="<?php echo sanitize_html_class( $this->get_field_id( 'email' ) ); ?>" 
                   name="<?php echo esc_attr( $this->get_field_name( 'email' ) ); ?>" 
                   type="text" 
                   value="<?php echo esc_attr( $email ); ?>" />
        </p>

        <?php
    }

    public function update( $new_instance, $old_instance ){
        $instance = array();
        $instance['title'] = (!empty( $new_instance['title'] ) ) ? strip_tags( $new_instance['title'] ) : '';
        $instance['email'] = (!empty( $new_instance['email'] ) ) ? strip_tags( $new_instance['email'] ) : '';
        $instance['address'] = (!empty( $new_instance['address'] ) ) ? strip_tags( $new_instance['address'] ) : '';
        $instance['phone'] = (!empty( $new_instance['phone'] ) ) ? strip_tags( $new_instance['phone'] ) : '';
        return $instance;
    }

}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       Connect Social Widget
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class nfw_connect_social_widget extends WP_Widget {

    function __construct(){
        parent::__construct(
                'nfw_connect_social_widget', __( 'FirstOne - Connect With Us', 'firstone_domain' ), array(
            'description' => __( 'Connect With Us widget', 'firstone_domain' ),)
        );
    }

    public function widget( $args, $instance ){
        $title = apply_filters( 'widget_title', $instance['title'] );
        $facebook = apply_filters( 'widget_facebook', $instance['facebook'] );
        $googleplus = apply_filters( 'widget_googleplus', $instance['googleplus'] );
        $twitter = apply_filters( 'widget_twitter', $instance['twitter'] );
        $pinterest = apply_filters( 'widget_pinterest', $instance['pinterest'] );
        $youtube = apply_filters( 'widget_youtube', $instance['youtube'] );
        $linkedin = apply_filters( 'widget_linkedin', $instance['linkedin'] );

        echo wp_kses_post( $args['before_widget'] );
        ?>
        <div class="widget nfw_widget_social_media">

            <?php
            if( trim( $title ) != '' ){
                echo wp_kses_post( $args['before_title'] );
                echo esc_html( $title );
                echo wp_kses_post( $args['after_title'] );
            }
            ?>

            <?php if( filter_var( $facebook, FILTER_VALIDATE_URL ) ): ?>
                <a href="<?php echo esc_url( $facebook ); ?>" class="facebook-icon social-icon">
                    <i class="fa fa-facebook"></i>
                </a>
            <?php endif; ?>

            <?php if( filter_var( $twitter, FILTER_VALIDATE_URL ) ): ?>
                <a href="<?php echo esc_url( $twitter ); ?>" class="twitter-icon social-icon">
                    <i class="fa fa-twitter"></i>
                </a>
            <?php endif; ?>

            <?php if( filter_var( $googleplus, FILTER_VALIDATE_URL ) ): ?>
                <a href="<?php echo esc_url( $googleplus ); ?>" class="google-icon social-icon">
                    <i class="fa fa-google-plus"></i>
                </a>
            <?php endif; ?>

            <?php if( filter_var( $linkedin, FILTER_VALIDATE_URL ) ): ?>
                <a href="<?php echo esc_url( $linkedin ); ?>" class="linkedin-icon social-icon">
                    <i class="fa fa-linkedin"></i>
                </a>
            <?php endif; ?>

            <?php if( filter_var( $youtube, FILTER_VALIDATE_URL ) ): ?>
                <a href="<?php echo esc_url( $youtube ); ?>" class="youtube-icon social-icon">
                    <i class="fa fa-youtube"></i>
                </a>
            <?php endif; ?>

            <?php if( filter_var( $pinterest, FILTER_VALIDATE_URL ) ): ?>
                <a href="<?php echo esc_url( $pinterest ); ?>" class="pinterest-icon social-icon">
                    <i class="fa fa-pinterest"></i>
                </a>
            <?php endif; ?>

        </div>

        <?php
        echo wp_kses_post( $args['after_widget'] );
    }

    public function form( $instance ){
        if( isset( $instance['title'] ) ){
            $title = $instance['title'];
        } else{
            $title = '';
        }
        ?>
        <p>
            <label for="<?php echo sanitize_html_class( $this->get_field_id( 'title' ) ); ?>"><?php _e( 'Title:', 'firstone_domain' ); ?></label>
            <input class="widefat" 
                   id="<?php echo sanitize_html_class( $this->get_field_id( 'title' ) ); ?>" 
                   name="<?php echo esc_attr( $this->get_field_name( 'title' ) ); ?>" 
                   type="text" 
                   value="<?php echo esc_attr( $title ); ?>" />
        </p>

        <?php
        if( isset( $instance['facebook'] ) ){
            $facebook = $instance['facebook'];
        } else{
            $facebook = '';
        }
        ?>
        <p>
            <label for="<?php echo sanitize_html_class( $this->get_field_id( 'facebook' ) ); ?>"><?php _e( 'Facebook link:', 'firstone_domain' ); ?></label>
            <input class="widefat" 
                   id="<?php echo sanitize_html_class( $this->get_field_id( 'facebook' ) ); ?>" 
                   name="<?php echo esc_attr( $this->get_field_name( 'facebook' ) ); ?>" 
                   type="text" 
                   value="<?php echo esc_attr( $facebook ); ?>" />
        </p>
        <?php
        if( isset( $instance['twitter'] ) ){
            $twitter = $instance['twitter'];
        } else{
            $twitter = '';
        }
        ?>
        <p>
            <label for="<?php echo sanitize_html_class( $this->get_field_id( 'twitter' ) ); ?>"><?php _e( 'Twitter link:', 'firstone_domain' ); ?></label>
            <input class="widefat" 
                   id="<?php echo sanitize_html_class( $this->get_field_id( 'twitter' ) ); ?>" 
                   name="<?php echo esc_attr( $this->get_field_name( 'twitter' ) ); ?>" 
                   type="text" 
                   value="<?php echo esc_attr( $twitter ); ?>" />
        </p>

        <?php
        if( isset( $instance['googleplus'] ) ){
            $googleplus = $instance['googleplus'];
        } else{
            $googleplus = '';
        }
        ?>
        <p>
            <label for="<?php echo sanitize_html_class( $this->get_field_id( 'googleplus' ) ); ?>"><?php _e( 'Googleplus link:', 'firstone_domain' ); ?></label>
            <input class="widefat" 
                   id="<?php echo sanitize_html_class( $this->get_field_id( 'googleplus' ) ); ?>" 
                   name="<?php echo esc_attr( $this->get_field_name( 'googleplus' ) ); ?>" 
                   type="text" 
                   value="<?php echo esc_attr( $googleplus ); ?>" />
        </p>
        <?php
        if( isset( $instance['linkedin'] ) ){
            $linkedin = $instance['linkedin'];
        } else{
            $linkedin = '';
        }
        ?>
        <p>
            <label for="<?php echo sanitize_html_class( $this->get_field_id( 'linkedin' ) ); ?>"><?php _e( 'LinkedIn link:', 'firstone_domain' ); ?></label>
            <input class="widefat" 
                   id="<?php echo sanitize_html_class( $this->get_field_id( 'linkedin' ) ); ?>" 
                   name="<?php echo esc_attr( $this->get_field_name( 'linkedin' ) ); ?>" 
                   type="text" 
                   value="<?php echo esc_attr( $linkedin ); ?>" />
        </p>

        <?php
        if( isset( $instance['youtube'] ) ){
            $youtube = $instance['youtube'];
        } else{
            $youtube = '';
        }
        ?>
        <p>
            <label for="<?php echo sanitize_html_class( $this->get_field_id( 'youtube' ) ); ?>"><?php _e( 'Youtube link:', 'firstone_domain' ); ?></label>
            <input class="widefat" 
                   id="<?php echo sanitize_html_class( $this->get_field_id( 'youtube' ) ); ?>" 
                   name="<?php echo esc_attr( $this->get_field_name( 'youtube' ) ); ?>" 
                   type="text" 
                   value="<?php echo esc_attr( $youtube ); ?>" />
        </p>

        <?php
        if( isset( $instance['pinterest'] ) ){
            $pinterest = $instance['pinterest'];
        } else{
            $pinterest = '';
        }
        ?>
        <p>
            <label for="<?php echo sanitize_html_class( $this->get_field_id( 'pinterest' ) ); ?>"><?php _e( 'Pinterest link:', 'firstone_domain' ); ?></label>
            <input class="widefat" 
                   id="<?php echo sanitize_html_class( $this->get_field_id( 'pinterest' ) ); ?>" 
                   name="<?php echo esc_attr( $this->get_field_name( 'pinterest' ) ); ?>" 
                   type="text" 
                   value="<?php echo esc_attr( $pinterest ); ?>" />
        </p>

        <?php
    }

    public function update( $new_instance, $old_instance ){
        $instance = array();
        $instance['title'] = (!empty( $new_instance['title'] ) ) ? strip_tags( $new_instance['title'] ) : '';
        $instance['facebook'] = (!empty( $new_instance['facebook'] ) ) ? strip_tags( $new_instance['facebook'] ) : '';
        $instance['googleplus'] = (!empty( $new_instance['googleplus'] ) ) ? strip_tags( $new_instance['googleplus'] ) : '';
        $instance['twitter'] = (!empty( $new_instance['twitter'] ) ) ? strip_tags( $new_instance['twitter'] ) : '';
        $instance['pinterest'] = (!empty( $new_instance['pinterest'] ) ) ? strip_tags( $new_instance['pinterest'] ) : '';
        $instance['linkedin'] = (!empty( $new_instance['linkedin'] ) ) ? strip_tags( $new_instance['linkedin'] ) : '';
        $instance['youtube'] = (!empty( $new_instance['youtube'] ) ) ? strip_tags( $new_instance['youtube'] ) : '';
        return $instance;
    }

}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       Twitter Widget 
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class nfw_twitter_widget extends WP_Widget {

    function __construct(){
        parent::__construct(
                'nfw_twitter_widget', __( 'FirstOne - Twitter', 'firstone_domain' ), array(
            'description' => __( 'Twitter widget', 'firstone_domain' ),)
        );
    }

    public function widget( $args, $instance ){
        $title = apply_filters( 'widget_title', $instance['title'] );
        $id = apply_filters( 'widget_id', $instance['id'] );
        $count = apply_filters( 'widget_count', $instance['count'] );

        echo wp_kses_post( $args['before_widget'] );
        ?>

        <div class="widget nfw_widget_latest_tweets">

            <?php
            if( trim( $title ) != '' ){
                echo wp_kses_post( $args['before_title'] );
                echo esc_html( $title );
                echo wp_kses_post( $args['after_title'] );
            }
            ?>
            <?php
            if( trim( $id ) != '' ):
                if( preg_match( "/[^0-9]/", $count ) ){
                    $count = 1;
                }
                ?>
                <div class="nfw-tweet-list" data-account-id="<?php echo esc_attr( $id ); ?>" data-items="<?php echo esc_attr( $count ); ?>"></div>
            <?php endif; ?>

        </div>        

        <?php
        echo wp_kses_post( $args['after_widget'] );
    }

    public function form( $instance ){
        if( isset( $instance['title'] ) ){
            $title = $instance['title'];
        } else{
            $title = '';
        }
        ?>
        <p>
            <label for="<?php echo sanitize_html_class( $this->get_field_id( 'title' ) ); ?>"><?php _e( 'Title:', 'firstone_domain' ); ?></label>
            <input class="widefat" 
                   id="<?php echo sanitize_html_class( $this->get_field_id( 'title' ) ); ?>" 
                   name="<?php echo esc_attr( $this->get_field_name( 'title' ) ); ?>" 
                   type="text" 
                   value="<?php echo esc_attr( $title ); ?>" />
        </p>

        <?php
        if( isset( $instance['id'] ) ){
            $id = $instance['id'];
        } else{
            $id = '';
        }
        ?>
        <p>
            <label for="<?php echo sanitize_html_class( $this->get_field_id( 'id' ) ); ?>"><?php _e( 'Twitter Widget ID:', 'firstone_domain' ); ?></label>
            <input class="widefat" 
                   id="<?php echo sanitize_html_class( $this->get_field_id( 'id' ) ); ?>" 
                   name="<?php echo esc_attr( $this->get_field_name( 'id' ) ); ?>" 
                   type="text" 
                   value="<?php echo esc_attr( $id ); ?>" />
            <label><?php _e( '### HOW TO CREATE A VALID ID TO USE: ###<br>
                * Go to www.twitter.com and sign in as normal, go to your settings page.<br>
                * Go to "Widgets" on the left hand side.<br>
                * Create a new widget for what you need eg "user time line" or "search" etc.<br>
                * Feel free to check "exclude replies" if you do not want replies in results.<br>
                * Now go back to settings page, and then go back to widgets page and you should see the widget you just created. Click edit.<br>
                * Look at the URL in your web browser, you will see a long number like this:<br>
                * 345735908357048478<br>
                * Use this as your ID instead!', 'firstone_domain' ); ?></label>

        </p>

        <?php
        if( isset( $instance['count'] ) ){
            $count = $instance['count'];
        } else{
            $count = '1';
        }
        ?>
        <p>
            <label for="<?php echo sanitize_html_class( $this->get_field_id( 'count' ) ); ?>"><?php _e( 'Number of tweets:', 'firstone_domain' ); ?></label>
            <input class="widefat" 
                   id="<?php echo sanitize_html_class( $this->get_field_id( 'count' ) ); ?>" 
                   name="<?php echo esc_attr( $this->get_field_name( 'count' ) ); ?>" 
                   type="text" 
                   value="<?php echo esc_attr( $count ); ?>" />
        </p>

        <?php
    }

    public function update( $new_instance, $old_instance ){
        $instance = array();
        $instance['title'] = (!empty( $new_instance['title'] ) ) ? strip_tags( $new_instance['title'] ) : '';
        $instance['id'] = (!empty( $new_instance['id'] ) ) ? strip_tags( $new_instance['id'] ) : '';
        $instance['count'] = (!empty( $new_instance['count'] ) ) ? strip_tags( $new_instance['count'] ) : '';
        return $instance;
    }

}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       Flickr Widget 
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class nfw_flickr_widget extends WP_Widget {

    function __construct(){
        parent::__construct(
                'nfw_flickr_widget', __( 'FirstOne - Flickr', 'firstone_domain' ), array(
            'description' => __( 'Flickr gallery widget', 'firstone_domain' ),)
        );
    }

    public function widget( $args, $instance ){
        $user = apply_filters( 'widget_user', $instance['user'] );
        $title = apply_filters( 'widget_title', $instance['title'] );
        $images = apply_filters( 'widget_images', $instance['images'] );

        if( trim( $images ) != '' ){
            if( preg_match( "/[^0-9]/", $images ) ){
                $images = 1;
            }
        } else{
            $images = 1;
        }

        echo wp_kses_post( $args['before_widget'] );
        ?>
        <div class="widget nfw_widget_flickr">
            <?php
            if( trim( $title ) != '' ){
                echo wp_kses_post( $args['before_title'] );
                echo esc_html( $title );
                echo wp_kses_post( $args['after_title'] );
            }
            ?>
            <div class="flickr-feed">
                <?php if( trim( $user ) != '' ): ?>
                    <script type="text/javascript" src="http://www.flickr.com/badge_code_v2.gne?count=<?php echo esc_attr( $images ); ?>&amp;display=latest&amp;size=s&amp;layout=x&amp;source=user&amp;user=<?php echo esc_attr( $user ); ?>"></script>                    
                <?php endif; ?>
            </div>
        </div>

        <?php
        echo wp_kses_post( $args['after_widget'] );
    }

    public function form( $instance ){
        if( isset( $instance['title'] ) ){
            $title = $instance['title'];
        } else{
            $title = '';
        }
        ?>
        <p>
            <label for="<?php echo sanitize_html_class( $this->get_field_id( 'title' ) ); ?>"><?php _e( 'Title:', 'firstone_domain' ); ?></label>
            <input class="widefat" 
                   id="<?php echo sanitize_html_class( $this->get_field_id( 'title' ) ); ?>" 
                   name="<?php echo esc_attr( $this->get_field_name( 'title' ) ); ?>" 
                   type="text" 
                   value="<?php echo esc_attr( $title ); ?>" />
        </p>

        <?php
        if( isset( $instance['user'] ) ){
            $user = $instance['user'];
        } else{
            $user = '';
        }
        ?>
        <p>
            <label for="<?php echo sanitize_html_class( $this->get_field_id( 'user' ) ); ?>"><?php _e( 'Flicker User ID:', 'firstone_domain' ); ?></label>
            <input class="widefat" 
                   id="<?php echo sanitize_html_class( $this->get_field_id( 'user' ) ); ?>" 
                   name="<?php echo esc_attr( $this->get_field_name( 'user' ) ); ?>" 
                   type="text" 
                   value="<?php echo esc_attr( $user ); ?>" />
            <label><?php _e( 'Use ', 'firstone_domain' ); ?><a href='http://idgettr.com/' target='_blank'>idgettr.com</a><?php _e( ' to get the Flicker ID number.', 'firstone_domain' ); ?></label>
        </p>

        <?php
        if( isset( $instance['images'] ) ){
            $images = $instance['images'];
        } else{
            $images = '';
        }
        ?>
        <p>
            <label for="<?php echo sanitize_html_class( $this->get_field_id( 'images' ) ); ?>"><?php _e( 'Number of images:', 'firstone_domain' ); ?></label>
            <input class="widefat" 
                   id="<?php echo sanitize_html_class( $this->get_field_id( 'images' ) ); ?>" 
                   name="<?php echo esc_attr( $this->get_field_name( 'images' ) ); ?>" 
                   type="text" 
                   value="<?php echo esc_attr( $images ); ?>" />
        </p>

        <?php
    }

    public function update( $new_instance, $old_instance ){
        $instance = array();
        $instance['user'] = (!empty( $new_instance['user'] ) ) ? strip_tags( $new_instance['user'] ) : '';
        $instance['title'] = (!empty( $new_instance['title'] ) ) ? strip_tags( $new_instance['title'] ) : '';
        $instance['images'] = (!empty( $new_instance['images'] ) ) ? strip_tags( $new_instance['images'] ) : '';
        return $instance;
    }

}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       Posts Widget 
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class nfw_posts_widget extends WP_Widget {

    function __construct(){
        parent::__construct(
                'nfw_posts_widget', __( 'FirstOne - Recent posts', 'firstone_domain' ), array(
            'description' => __( 'Displays recent posts with a thumbnail', 'firstone_domain' ),)
        );
    }

    public function widget( $args, $instance ){
        $title = apply_filters( 'widget_title', $instance['title'] );
        $count = apply_filters( 'widget_count', $instance['count'] );

        if( trim( $count ) != '' ){
            if( preg_match( "/[^0-9]/", $count ) ){
                $count = 1;
            }
        } else{
            $count = 1;
        }

        echo wp_kses_post( $args['before_widget'] );
        ?>
        <div class="widget widget_recent_entries">
            <?php
            if( trim( $title ) != '' ){
                echo wp_kses_post( $args['before_title'] );
                echo esc_html( $title );
                echo wp_kses_post( $args['after_title'] );
            }
            ?>

            <ul>
                <?php
                $recent_posts = wp_get_recent_posts( array('numberposts' => $count, 'post_status' => 'publish') );
                foreach( $recent_posts as $recent ):
                    ?>
                    <li>
                        <?php echo get_the_post_thumbnail( $recent["ID"], 'nfw_image_70_70' ); ?>
                        <a href="<?php echo esc_url( get_the_permalink( $recent["ID"] ) ); ?>"><?php echo esc_html( substr( $recent["post_title"], 0, 40 ) ); ?></a>
                        <p><?php echo esc_html($recent["post_excerpt"]); ?></p>
                    </li>
                    <?php
                endforeach;
                ?>

            </ul>
        </div>

        <?php
        echo wp_kses_post( $args['after_widget'] );
    }

    public function form( $instance ){
        if( isset( $instance['title'] ) ){
            $title = $instance['title'];
        } else{
            $title = __( 'Blog', 'firstone_domain' );
        }
        ?>
        <p>
            <label for="<?php echo sanitize_html_class( $this->get_field_id( 'title' ) ); ?>"><?php _e( 'Title:', 'firstone_domain' ); ?></label>
            <input class="widefat" 
                   id="<?php echo sanitize_html_class( $this->get_field_id( 'title' ) ); ?>" 
                   name="<?php echo esc_attr( $this->get_field_name( 'title' ) ); ?>" 
                   type="text" 
                   value="<?php echo esc_attr( $title ); ?>" />
        </p>

        <?php
        if( isset( $instance['count'] ) ){
            $count = $instance['count'];
        } else{
            $count = '';
        }
        ?>
        <p>
            <label for="<?php echo sanitize_html_class( $this->get_field_id( 'count' ) ); ?>"><?php _e( 'Number of posts:', 'firstone_domain' ); ?></label>
            <input class="widefat" 
                   id="<?php echo sanitize_html_class( $this->get_field_id( 'count' ) ); ?>" 
                   name="<?php echo esc_attr( $this->get_field_name( 'count' ) ); ?>" 
                   type="text" 
                   value="<?php echo esc_attr( $count ); ?>" />
        </p>

        <?php
    }

    public function update( $new_instance, $old_instance ){
        $instance = array();
        $instance['title'] = (!empty( $new_instance['title'] ) ) ? strip_tags( $new_instance['title'] ) : '';
        $instance['count'] = (!empty( $new_instance['count'] ) ) ? strip_tags( $new_instance['count'] ) : '';
        return $instance;
    }

}
