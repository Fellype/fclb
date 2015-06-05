<?php

// Directs VC to the templates used for accordion and tabs
vc_set_shortcodes_templates_dir( get_stylesheet_directory() . '/framework/composer/' );

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       VC CUSTOM ALERT ELEMENTS
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function nfw_alert_elements_func( $atts, $content = null ){
    extract( shortcode_atts( array(
        'nfw_alert_type' => '',
        'nfw_content' => '',
                    ), $atts ) );

    $content = esc_html( $content );

    // Determines the type of alert
    if( $nfw_alert_type == "info" ){
        return "<div class='alert info'><i class='ifc-info'></i>{$content}</div>";
    } elseif( $nfw_alert_type == "success" ){
        return "<div class='alert success'><i class='ifc-checkmark'></i>{$content}</div>";
    } elseif( $nfw_alert_type == "warning" ){
        return "<div class='alert warning'><i class='ifc-error'></i>{$content}</div>";
    } elseif( $nfw_alert_type == "error" ){
        return "<div class='alert error'><i class='ifc-close'></i>{$content}</div>";
    } else{
        return "<div class='alert'>{$content}</div>";
    }
}

add_shortcode( 'nfw_alert_elements', 'nfw_alert_elements_func' );

add_action( 'init', 'nfw_integrate_vc_alert_elements' );

// integrates the custom element in the visual composer
function nfw_integrate_vc_alert_elements(){
    vc_map(
            array(
                "name" => __( "Message box", 'firstone_domain' ),
                "base" => "nfw_alert_elements",
                "icon" => get_template_directory_uri() . '/framework/admin/images/icons/theme_options_menu_icon.png',
                "category" => __( "Discovery Elements", 'firstone_domain' ),
                "params" => array(
                    array(
                        'type' => 'dropdown',
                        'holder' => 'div',
                        'heading' => __( 'Message Type', 'firstone_domain' ),
                        'param_name' => 'nfw_alert_type',
                        'value' => array(
                            __( 'Info', 'firstone_domain' ) => 'info',
                            __( 'Default', 'firstone_domain' ) => 'default',
                            __( 'Success', 'firstone_domain' ) => 'success',
                            __( 'Warning', 'firstone_domain' ) => 'warning',
                            __( 'Error', 'firstone_domain' ) => 'error',
                        ),
                        'description' => __( 'Specify', 'firstone_domain' )
                    ),
                    array(
                        "type" => "textfield",
                        "heading" => __( "Message", 'firstone_domain' ),
                        "param_name" => "content",
                        "value" => "",
                        "description" => __( "Specify the content of the message", 'firstone_domain' )
                    )
                )
            )
    );
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       VC CUSTOM MILESTONE ELEMENTS
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function nfw_milestones_func( $atts, $content = null ){ // New function parameter $content is added!
    extract( shortcode_atts( array(
        'nfw_milestone_stop' => '',
        'nfw_milestone_speed' => '',
        'nfw_milestone_icon' => ''
                    ), $atts ) );

    $content = esc_html( $content );

    $nfw_milestone_stop = absint( $nfw_milestone_stop );
    $nfw_milestone_speed = absint( $nfw_milestone_speed );
    $nfw_milestone_icon = esc_attr( $nfw_milestone_icon );

    $milestone_icon = '';
    if( trim( $nfw_milestone_icon ) != "" ){
        $milestone_icon = "<i class='{$nfw_milestone_icon}'></i>";
    }

    return "<div class='milestone'>
        
                {$milestone_icon}
                    
                        <div class='milestone-content'>
                            <span class='milestone-value' data-stop='{$nfw_milestone_stop}' data-speed='{$nfw_milestone_speed}'></span>
                            <span>+</span>
                            <div class='milestone-description'>{$content}</div>
                        </div>
                       
                    </div>";
}

add_shortcode( 'nfw_milestones', 'nfw_milestones_func' );

add_action( 'init', 'nfw_integrate_vc_milestones' );

// integrates the custom element in the visual composer
function nfw_integrate_vc_milestones(){
    vc_map(
            array(
                "name" => __( "Milestone", 'firstone_domain' ),
                "base" => "nfw_milestones",
                "icon" => get_template_directory_uri() . '/framework/admin/images/icons/theme_options_menu_icon.png',
                "category" => __( "Discovery Elements", 'firstone_domain' ),
                "params" => array(
                    array(
                        "type" => "textfield",
                        "heading" => __( "Number", 'firstone_domain' ),
                        "param_name" => "nfw_milestone_stop",
                        "value" => "1",
                        "description" => __( "The final value will animate to, from 0 to the number provided by you", 'firstone_domain' )
                    ),
                    array(
                        "type" => "textfield",
                        "heading" => __( "Speed", 'firstone_domain' ),
                        "param_name" => "nfw_milestone_speed",
                        "value" => "2000",
                        "description" => __( "Specify the animation speed", 'firstone_domain' )
                    ),
                    array(
                        "type" => "textfield",
                        'holder' => 'div',
                        "heading" => __( "Milestone Details", 'firstone_domain' ),
                        "param_name" => "content"
                    ),
                    array(
                        "type" => "nfw_icomoon_icons_param",
                        "heading" => __( "Select icon", 'firstone_domain' ),
                        "param_name" => "nfw_milestone_icon",
                        "description" => __( "Select the icon you want", 'firstone_domain' )
                    )
                )
            )
    );
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       VC CUSTOM ICON BOX ELEMENTS
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// the short code function for the icon box elements
function nfw_icon_boxes_func( $atts, $content = null ){ // New function parameter $content is added!
    extract( shortcode_atts( array(
        'nfw_icon_box_icon' => '',
        'nfw_icon_box_link' => '',
        'nfw_icon_box_title' => ''
                    ), $atts ) );

    $nfw_icon_box_icon = sanitize_html_class( $nfw_icon_box_icon );
    $nfw_icon_box_title = esc_html( $nfw_icon_box_title );

    $content_p = wp_kses_post( $content );
    if( trim( $content ) != '' ){
        $content_p = "<p>{$content}</p>";
    }

    $newtab = $icon_part = $read_more = $link_start = $link_end = '';

    $link_details = vc_build_link( $nfw_icon_box_link );

    $link_details['target'] = esc_attr( $link_details['target'] );

    if( $link_details['target'] !== '' ){
        $newtab = "target='{$link_details['target']}'";
    }

    $link_details['url'] = esc_url( $link_details['url'] );

    $link_details['title'] = esc_html( $link_details['title'] );

    if( trim( $link_details['url'] ) != '' ){
        $read_more = "<a class='btn text-uppercase' href='{$link_details['url']}' {$newtab}>{$link_details['title']}</a>";
        $link_start = "<a href='{$link_details['url']}' {$newtab}>";
        $link_end = "</a>";
    }

    $icon_part = "<i class='{$nfw_icon_box_icon}'></i>";

    $output = "<div class='icon-box-1'>
            
                        {$icon_part}

                            <div class='icon-box-content'>

                                <h3>
                                    {$link_start}<strong>{$nfw_icon_box_title}</strong>{$link_end}
                                </h3>

                                {$content_p}
                                    
                                {$read_more}

                            </div><!-- end .icon-box-content -->

                        </div>";

    return $output;
}

add_shortcode( 'nfw_icon_boxes', 'nfw_icon_boxes_func' );
add_action( 'init', 'nfw_integrate_vc_icon_boxes' );

// integrates the custom element in the visual composer
function nfw_integrate_vc_icon_boxes(){
    vc_map(
            array(
                "name" => __( "Icon Box", 'firstone_domain' ),
                "base" => "nfw_icon_boxes",
                "icon" => get_template_directory_uri() . '/framework/admin/images/icons/theme_options_menu_icon.png',
                "category" => __( "Discovery Elements", 'firstone_domain' ),
                "params" => array(
                    array(
                        "type" => "textfield",
                        'holder' => 'div',
                        "heading" => __( "Title", 'firstone_domain' ),
                        "param_name" => "nfw_icon_box_title",
                        "value" => __( "Title", 'firstone_domain' ),
                        "description" => __( "The service title", 'firstone_domain' )
                    ),
                    array(
                        "type" => "vc_link",
                        "heading" => __( "Title link", 'firstone_domain' ),
                        "param_name" => "nfw_icon_box_link",
                        "description" => __( "Specify an optional link pointing to a details page", 'firstone_domain' )
                    ),
                    array(
                        "type" => "nfw_icomoon_icons_param",
                        "heading" => __( "Select icon", 'firstone_domain' ),
                        "param_name" => "nfw_icon_box_icon",
                        "description" => __( "Select the icon you want", 'firstone_domain' )
                    ),
                    array(
                        "type" => "textarea_html",
                        "heading" => __( "Content", 'firstone_domain' ),
                        "param_name" => "content",
                        "description" => __( "Add description text for the service", 'firstone_domain' )
                    )
                )
            )
    );
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       VC CUSTOM PIE CHART ELEMENTS
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// the short code function for the pie charts VC elements
function nfw_pie_chart_func( $atts ){ // New function parameter $content is added!
    extract( shortcode_atts( array(
        'nfw_data_barcolor' => '#FFF',
        'nfw_data_trackcolor' => '#FFF',
        'nfw_pie_chart_percent' => '0',
        'nfw_pie_chart_linewidth' => '0',
        'nfw_pie_chart_barsize' => '0',
        'nfw_pie_chart_option' => '1',
        'nfw_pie_chart_text' => ''
                    ), $atts ) );

    $nfw_pie_chart_text = esc_html( $nfw_pie_chart_text );
    $nfw_data_barcolor = esc_attr( $nfw_data_barcolor );
    $nfw_data_trackcolor = esc_attr( $nfw_data_trackcolor );

    $nfw_pie_chart_percent = absint( $nfw_pie_chart_percent );
    $nfw_pie_chart_linewidth = absint( $nfw_pie_chart_linewidth );
    $nfw_pie_chart_barsize = absint( $nfw_pie_chart_barsize );

    $output = "<div class='pie-chart'
            data-percent='{$nfw_pie_chart_percent}' 
            data-barColor='{$nfw_data_barcolor}' 
            data-trackColor='{$nfw_data_trackcolor}' 
            data-lineWidth='{$nfw_pie_chart_linewidth}'
            data-barSize='{$nfw_pie_chart_barsize}'>
                <div class='pie-chart-percent'>
                                <span></span>
                                %
                                </div>

                        <div class='pie-chart-description'>{$nfw_pie_chart_text}</div>
                        </div>";

    return $output;
}

add_shortcode( 'nfw_pie_chart', 'nfw_pie_chart_func' );
add_action( 'init', 'nfw_integrate_vc_pie_chart' );

// integrates the custom element in the visual composer
function nfw_integrate_vc_pie_chart(){
    vc_map(
            array(
                "name" => __( "Pie Chart", 'firstone_domain' ),
                "base" => "nfw_pie_chart",
                "icon" => get_template_directory_uri() . '/framework/admin/images/icons/theme_options_menu_icon.png',
                "category" => __( "Discovery Elements", 'firstone_domain' ),
                "params" => array(
                    array(
                        "type" => "textfield",
                        'holder' => 'div',
                        "heading" => __( "Pie Chart Description", 'firstone_domain' ),
                        "param_name" => "nfw_pie_chart_text",
                        "value" => __( "text", 'firstone_domain' ),
                        "description" => __( "Specify chart text", 'firstone_domain' )
                    ),
                    array(
                        "type" => "textfield",
                        "heading" => __( "Chart percent", 'firstone_domain' ),
                        "param_name" => "nfw_pie_chart_percent",
                        "value" => "1",
                        "description" => __( "Specify a value from 0 to 100", 'firstone_domain' )
                    ),
                    array(
                        "type" => "textfield",
                        "heading" => __( "Pie Chart Bar Thickness", 'firstone_domain' ),
                        "param_name" => "nfw_pie_chart_linewidth",
                        "value" => "5",
                        "description" => __( "Numeric value between 5 and 15", 'firstone_domain' )
                    ),
                    array(
                        "type" => "textfield",
                        "heading" => __( "Bar Width", 'firstone_domain' ),
                        "param_name" => "nfw_pie_chart_barsize",
                        "value" => "200",
                        "description" => __( "Specify bar width", 'firstone_domain' )
                    ),
                    array(
                        "type" => "colorpicker",
                        "heading" => __( "Bar Color", 'firstone_domain' ),
                        "param_name" => "nfw_data_barcolor",
                        "value" => '#2a2a2a',
                        "description" => __( "Specify Bar-Color", 'firstone_domain' )
                    ),
                    array(
                        "type" => "colorpicker",
                        "class" => "piechart_options_display_trigger",
                        "heading" => __( "Track Color", 'firstone_domain' ),
                        "param_name" => "nfw_data_trackcolor",
                        "value" => '#e0e0e0',
                        "description" => __( "Specify Track-Color", 'firstone_domain' )
                    )
                )
            )
    );
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       VC CUSTOM PROGRESS BAR ELEMENTS
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// the short code function for the progress bar VC elements
function nfw_progress_bar_func( $atts, $content = null ){ // New function parameter $content is added!
    extract( shortcode_atts( array(
        'nfw_progress_bar_data_width' => '0'
                    ), $atts ) );

    $content = esc_html( $content );

    $nfw_progress_bar_data_width = absint( $nfw_progress_bar_data_width );

    $output = "<div class='fixed'>
                        <div class='progress-bar-description'>
                            <span>{$nfw_progress_bar_data_width}%</span>
                                {$content}
                        </div>
                       
                        <div class='progress-bar'>  
                        	<span class='progress-bar-outer' data-width='{$nfw_progress_bar_data_width}'> 
                            	<span class='progress-bar-inner'></span> 
                            </span>
                        </div></div>";

    return $output;
}

add_shortcode( 'nfw_progress_bar', 'nfw_progress_bar_func' );

add_action( 'init', 'nfw_integrate_vc_progress_bar' );

// integrates the progess bar element in the visual composer
function nfw_integrate_vc_progress_bar(){
    vc_map(
            array(
                "name" => __( "Progress Bar", 'firstone_domain' ),
                "base" => "nfw_progress_bar",
                "icon" => get_template_directory_uri() . '/framework/admin/images/icons/theme_options_menu_icon.png',
                "category" => __( "Discovery Elements", 'firstone_domain' ),
                "params" => array(
                    array(
                        "type" => "textfield",
                        'holder' => 'div',
                        "heading" => __( "Title", 'firstone_domain' ),
                        "param_name" => "content",
                        "value" => __( "title", 'firstone_domain' ),
                        "description" => __( "The title of the progress bar", 'firstone_domain' )
                    ),
                    array(
                        "type" => "textfield",
                        "heading" => __( "Value", 'firstone_domain' ),
                        "param_name" => "nfw_progress_bar_data_width",
                        "value" => "90",
                        "description" => __( "Specify a value between 1 and 100, it represents the loaded percentage", 'firstone_domain' )
                    )
                )
            )
    );
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       VC CUSTOM SOCIAL MEDIA ELEMENTS
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// the short code function for the custom element
function nfw_social_media_func( $atts ){
    extract( shortcode_atts( array(
        'nfw_social_icon' => '',
        'nfw_social_link' => ''
                    ), $atts ) );

    $output = '';

    $nfw_social_icon = esc_attr( $nfw_social_icon );

    $icon_parts = explode( '-', $nfw_social_icon );

    if( isset( $icon_parts[1] ) ){
        $icon = $icon_parts[1];

        if( $icon == 'stack' ){
            $icon.='-' . $icon_parts[2];
        }
    }

    if( filter_var( $nfw_social_link, FILTER_VALIDATE_URL ) ){
        $nfw_social_link = esc_url( $nfw_social_link );
        $icon = esc_attr( $icon );
        $output.= "<a href='{$nfw_social_link}' class='{$icon}-icon social-icon'>
                                <i class='{$nfw_social_icon}'></i>
                        </a>";
    }

    return $output;
}

add_shortcode( 'nfw_social_media', 'nfw_social_media_func' );
add_action( 'init', 'nfw_integrate_vc_social_media' );

// integrates the custom element in the visual composer
function nfw_integrate_vc_social_media(){
    vc_map( array(
        "name" => __( "Social Media", 'firstone_domain' ),
        "base" => "nfw_social_media",
        "icon" => get_template_directory_uri() . '/framework/admin/images/icons/theme_options_menu_icon.png',
        "category" => __( "Discovery Elements", 'firstone_domain' ),
        "params" => array(
            array(
                "type" => "nfw_fa_icons_param",
                'holder' => 'div',
                "heading" => __( "Social icon", 'firstone_domain' ),
                "param_name" => "nfw_social_icon",
                "value" => "",
                "description" => __( "Select social icon", 'firstone_domain' )
            ),
            array(
                "type" => "textfield",
                'holder' => 'div',
                "heading" => __( "Social link", 'firstone_domain' ),
                "param_name" => "nfw_social_link",
                "value" => "",
                "description" => __( "Specify social link", 'firstone_domain' )
            )
        )
            )
    );
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       VC CUSTOM TESTIMONIAL ELEMENTS
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function nfw_testimonial_func( $atts, $content = null ){ // New function parameter $content is added!
    extract( shortcode_atts( array(
        'nfw_testimonial_name' => '',
        'nfw_testimonial_image' => ''
                    ), $atts ) );

    $content = esc_html( $content );
    $nfw_testimonial_name = esc_html( $nfw_testimonial_name );

    $image_area = '';
    if( trim( $nfw_testimonial_image ) != '' ){
        $nfw_image_id = filter_var( $nfw_testimonial_image, FILTER_SANITIZE_NUMBER_INT );

        $image_data = wp_get_attachment_image_src( $nfw_image_id, 'nfw_image_70_70' );
        $image_url = esc_url( $image_data[0] );

        $image_area = "<img src='{$image_url}' alt=''>";
    }

    $output = "<div class='headline nfw-testimonial'>

                    <h1>{$nfw_testimonial_name}</h1>

                </div><!--end .headline -->

            <div class='testimonial'>

                    <blockquote>
                    <p>{$content}</p>
                    </blockquote>

                    {$image_area}

            </div>";

    return $output;
}

add_shortcode( 'nfw_testimonial', 'nfw_testimonial_func' );

add_action( 'init', 'nfw_integrate_vc_testimonial' );

// integrates the custom element in the visual composer
function nfw_integrate_vc_testimonial(){
    vc_map(
            array(
                "name" => __( "Testimonial", 'firstone_domain' ),
                "base" => "nfw_testimonial",
                "icon" => get_template_directory_uri() . '/framework/admin/images/icons/theme_options_menu_icon.png',
                "category" => __( "Discovery Elements", 'firstone_domain' ),
                "params" => array(
                    array(
                        "type" => "textfield",
                        'holder' => 'div',
                        "heading" => __( "Name", 'firstone_domain' ),
                        "param_name" => "nfw_testimonial_name",
                        "value" => __( "Sample name", 'firstone_domain' ),
                        "description" => __( "Specify the name of the testimonial author", 'firstone_domain' )
                    ),
                    array(
                        "type" => "textarea",
                        "heading" => __( "Testimonial", 'firstone_domain' ),
                        "param_name" => "content",
                        "value" => "",
                        "description" => __( "Specify the text of the testimonial", 'firstone_domain' )
                    ),
                    array(
                        'type' => 'attach_image',
                        'heading' => __( 'Image', 'firstone_domain' ),
                        'param_name' => 'nfw_testimonial_image',
                        'description' => __( 'Add an image for the testimonial', 'firstone_domain' )
                    )
                )
            )
    );
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       VC CUSTOM PRICING TABLE ELEMENTS
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function nfw_pricing_table_func( $atts ){ // New function parameter $content is added!
    extract( shortcode_atts( array(
        'nfw_pricing_table_price' => '',
        'nfw_pricing_table_name' => '',
        'nfw_pricing_table_specifications' => '',
        'nfw_pricing_table_link' => ''
                    ), $atts ) );

    $specifications_elements = mb_split( '<br />', $nfw_pricing_table_specifications );
    $nfw_pricing_table_name = esc_html( $nfw_pricing_table_name );
    $nfw_pricing_table_price = esc_html( $nfw_pricing_table_price );

    $link_details = vc_build_link( $nfw_pricing_table_link );
    $link_details['target'] = esc_attr( $link_details['target'] );
    $link_details['url'] = esc_url( $link_details['url'] );
    $link_details['title'] = esc_html( $link_details['title'] );

    $newtab = $nfw_price_type_1 = $nfw_price_type_2 = $table_link = $specifications_list = '';

    if( $link_details['target'] !== '' ){
        $newtab = "target='{$link_details['target']}'";
    }

    if( trim( $link_details['url'] ) != '' || trim( $link_details['title'] ) != '' ){
        $table_link = "<a class='btn text-uppercase' href='{$link_details['url']}' {$newtab}>{$link_details['title']}</a>";
    }
    $nfw_pricing_table_price_parts_1 = explode( ",", $nfw_pricing_table_price );
    $nfw_pricing_table_price_parts_2 = explode( ".", $nfw_pricing_table_price );

    // Handles the cases where the price is with , or .
    if( isset( $nfw_pricing_table_price_parts_1[1] ) ){
        $nfw_pricing_table_price_1 = esc_html( $nfw_pricing_table_price_parts_1[0] );
        $nfw_pricing_table_price_2 = "<sup>." . esc_html( $nfw_pricing_table_price_parts_1[1] ) . "</sup>";
    } elseif( isset( $nfw_pricing_table_price_parts_2[1] ) ){
        $nfw_pricing_table_price_1 = esc_html( $nfw_pricing_table_price_parts_2[0] );
        $nfw_pricing_table_price_2 = "<sup>." . esc_html( $nfw_pricing_table_price_parts_2[1] ) . "</sup>";
    } else{
        $nfw_pricing_table_price_1 = $nfw_pricing_table_price;
        $nfw_pricing_table_price_2 = "";
    }

    // Loops through each specifications row
    foreach( $specifications_elements as $element ){
        $specifications_list.='<li>' . esc_html( $element ) . '</li>';
    }

    $output = "<div class='pricing-table'>

                            <div class='pricing-table-header'>
                            
                                <h1>{$nfw_pricing_table_name}</h1>
                                    
                                <h2>
                                    {$nfw_pricing_table_price_1}
                                    {$nfw_pricing_table_price_2}
                                </h2>

                            </div><!-- end .pricing-table-header -->

                            <div class='pricing-table-offer'>                        

                                <ul>
                                    {$specifications_list}
                                </ul>

                            </div><!-- end .pricing-table-offer -->   

                            {$table_link}

                        </div><!-- end .pricing-table -->";

    return $output;
}

add_shortcode( 'nfw_pricing_table', 'nfw_pricing_table_func' );

add_action( 'init', 'nfw_integrate_vc_pricing_table' );

// integrates the custom element in the visual composer
function nfw_integrate_vc_pricing_table(){
    vc_map(
            array(
                "name" => __( "Pricing Table", 'firstone_domain' ),
                "base" => "nfw_pricing_table",
                "icon" => get_template_directory_uri() . '/framework/admin/images/icons/theme_options_menu_icon.png',
                "category" => __( "Discovery Elements", 'firstone_domain' ),
                "params" => array(
                    array(
                        "type" => "textfield",
                        'holder' => 'div',
                        "heading" => __( "Plan name", 'firstone_domain' ),
                        "param_name" => "nfw_pricing_table_name",
                        "value" => __( "Starter edition", 'firstone_domain' ),
                    ),
                    array(
                        "type" => "textfield",
                        "heading" => __( "Cost", 'firstone_domain' ),
                        "param_name" => "nfw_pricing_table_price",
                        "value" => '$30.88',
                    ),
                    array(
                        "type" => "textarea",
                        "heading" => __( "Plan features (add one per line)", 'firstone_domain' ),
                        "param_name" => "nfw_pricing_table_specifications",
                        "value" => "",
                        "description" => __( "Write the specifications", 'firstone_domain' )
                    ),
                    array(
                        "type" => "vc_link",
                        "heading" => __( "Read more button", 'firstone_domain' ),
                        "param_name" => "nfw_pricing_table_link",
                        "description" => __( "Specify an optional link pointing to a details page", 'firstone_domain' )
                    )
                )
            )
    );
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       VC CUSTOM PORTFOLIO ISOTOPE ELEMENTS
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function nfw_portfolio_func( $atts ){
    extract( shortcode_atts( array(
        'nfw_portfolio_max_number' => '',
        'nfw_portfolio_loadmore' => '',
        'nfw_portfolio_loadmore_text' => '',
        'nfw_portfolio_load_number' => '',
        'nfw_portfolio_all_text' => '',
        'nfw_portfolio_filter_disable' => ''
                    ), $atts ) );

    $type = 'portfolio';

    $nfw_portfolio_max_number = absint( $nfw_portfolio_max_number );
    $nfw_portfolio_load_number = absint( $nfw_portfolio_load_number );

    $args = array(
        'post_type' => $type,
        'post_status' => 'publish',
        'posts_per_page' => $nfw_portfolio_max_number,
        'ignore_sticky_posts' => 1);

    $loop = new WP_Query( $args );
    $output = '';

    $count = 0;
    $category_name = array();
    $categories_index = array();

    $portfolio_container_id = esc_attr( uniqid() );
    $nfw_portfolio_all_text = esc_html( $nfw_portfolio_all_text );
    // Get portfolio categories array
    $terms = get_terms( 'portfolio_categories' );
    $nfw_portfolio_loadmore_text = esc_html( $nfw_portfolio_loadmore_text );

    // Composes the portfolio category selection list
    if( $nfw_portfolio_filter_disable != 'yes' ){
        $output = "<div class='nfw-row'>
        <div class='nfw-span12'>
        <div class='portfolio-filter text-center'>
                    <ul>
			<li>
                            <a class='active' data-filter='*' href='#' >{$nfw_portfolio_all_text}</a>
			</li>";


        if( $terms && !is_wp_error( $terms ) ){
            foreach( $terms as $term ){
                $count++;
                $category_name = esc_html( $term->name );
                $output.="<li>
                         <a href='#' data-filter='.term-{$count}' >{$category_name}</a>
                    </li>";
                $categories_index[$category_name] = $count;
            }
        }

        $output.="</ul>"
                . "</div></div>"
                . "</div><!-- end .portfolio-filter -->";
    }

    $output.= "<ul id='{$portfolio_container_id}' class='portfolio-items fixed'>";

    while( $loop->have_posts() ){

        $terms_class = "item";
        $loop->the_post();
        $post_id = get_the_ID();

        $post_categories = get_the_terms( $post_id, 'portfolio_categories' );

        $thumbnail_id = get_post_thumbnail_id();

        $image_data = wp_get_attachment_image_src( $thumbnail_id, 'nfw_image_400_400' );

        $image_url = esc_url( $image_data[0] );

        $image_data_full = wp_get_attachment_image_src( $thumbnail_id, 'full' );

        $image_url_full = esc_url( $image_data_full[0] );

        $post_title = esc_html( get_the_title( $post_id ) );

        $post_link = esc_url( get_post_permalink( $post_id ) );

        $one_category = '';
        $icon_link = esc_url( get_template_directory_uri() . '/layout/images/icon-link.png' );
        $icon_zoom = esc_url( get_template_directory_uri() . '/layout/images/icon-zoom.png' );

        if( !empty( $post_categories ) && !empty( $categories_index ) ){
            foreach( $post_categories as $category ){
                $terms_class.=" term-" . esc_attr( $categories_index[$category->name] );
            }
            $one_category = $category->name;
        }

        // the $_GET["portfolio_post"] is used to indicate that the content is requested for an iframe
        $content_link=$post_link.'?portfolio_post='.$post_id;
        
        $output.= "<li class='{$terms_class}'>

                                <div class='portfolio-item'>

                                    <div class='portfolio-item-preview'>

                                        <img src='{$image_url}' alt=''>

                                        <div class='portfolio-item-overlay'>

                                            <div class='portfolio-item-description'>

                                                <h2>{$post_title}</h2>
                                                <h4>{$one_category}</h4>

                                            </div><!-- end .portfolio-item-description -->

                                            <div class='portfolio-item-overlay-actions'>

                                                <a class='portfolio-item-link' onclick='nfw_iframe_popup(this)' data-portfolio_post_src='{$content_link}'>
                                                    <img src='{$icon_link}' alt=''>
                                                </a>

                                                <a class='magnificPopup-gallery portfolio-item-zoom' href='{$image_url_full}'>                                            
                                                    <img src='{$icon_zoom}' alt=''>
                                                </a>

                                            </div><!-- end .portfolio-item-overlay-actions -->

                                        </div><!-- end .portfolio-item-overlay -->

                                    </div><!-- end .portfolio-item-preview -->

                                </div><!-- end .portfolio-item -->

                            </li>";
    }

    $output.="</ul>";

    
    $count_portfolios = wp_count_posts( 'portfolio' );

    $published_portfolios = $count_portfolios->publish;
    
    if( $nfw_portfolio_loadmore == "yes" && $nfw_portfolio_max_number<$published_portfolios){

        // Prepares the load more button and the ajax link
        $total_images_count = $nfw_portfolio_max_number + $nfw_portfolio_load_number;
        $nonce = wp_create_nonce( "nfw_custom_posts_isotope_nonce" );

        $link = esc_url( admin_url( 'admin-ajax.php?action=nfw_custom_posts_isotope'
                        . '&count_increment=' . $nfw_portfolio_load_number
                        . '&count_total=' . $nfw_portfolio_max_number
                        . '&custom_post_type=' . $type
                        . '&nonce=' . $nonce ) );

        $output.= "<div class='nfw-row'><div class='nfw-span12 text-center'>"
                . "<a class='btn load-more btn-large btn-orange nfw_load_more_trigger' id='{$portfolio_container_id}loadmore' "
                . "data-nonce='{$nonce}' "
                . "data-count_increment='{$nfw_portfolio_load_number}' "
                . "data-count_total='{$total_images_count}' "
                . "data-custom_post_type='{$type}' "
                . "data-target_container='{$portfolio_container_id}' "
                . "href='{$link}'>{$nfw_portfolio_loadmore_text}</a></div></div>";
    }
    wp_reset_query();
    return $output;
}

add_shortcode( 'nfw_portfolio', 'nfw_portfolio_func' );
add_action( 'init', 'nfw_integrate_vc_portfolio' );

// integrates the custom element in the visual composer
function nfw_integrate_vc_portfolio(){
    vc_map(
            array(
                "name" => __( "Portfolio", 'firstone_domain' ),
                "base" => "nfw_portfolio",
                "category" => __( "BusinessId Elements", 'firstone_domain' ),
                "icon" => get_template_directory_uri() . '/framework/admin/images/icons/theme_options_menu_icon.png',
                "params" => array(
                    array(
                        "type" => "textfield",
                        "heading" => __( "Initial number of projects", 'firstone_domain' ),
                        "param_name" => "nfw_portfolio_max_number",
                        "value" => "5",
                        "description" => __( "How many portfolio items to show, initially", 'firstone_domain' )
                    ),
                    array(
                        'type' => 'textfield',
                        'heading' => __( 'All Projects Caption', 'firstone_domain' ),
                        'param_name' => 'nfw_portfolio_all_text',
                        'description' => __( 'Specify the All projects caption', 'firstone_domain' ),
                        'value' => __( "All", 'firstone_domain' ),
                    ),
                    array(
                        'type' => 'checkbox',
                        'heading' => __( 'Show Load More button', 'firstone_domain' ),
                        'param_name' => 'nfw_portfolio_loadmore',
                        'description' => __( 'If Load More button is enabled, you can press it to load more projects', 'firstone_domain' ),
                        'value' => array(__( 'enable', 'firstone_domain' ) => 'yes')
                    ),
                    array(
                        'type' => 'textfield',
                        'heading' => __( 'Load More Button Caption', 'firstone_domain' ),
                        'param_name' => 'nfw_portfolio_loadmore_text',
                        'description' => __( 'Specify the load more caption', 'firstone_domain' ),
                        'value' => __( "Load More", 'firstone_domain' ),
                    ),
                    array(
                        "type" => "textfield",
                        "heading" => __( "Number of projects to load on Load More", 'firstone_domain' ),
                        "param_name" => "nfw_portfolio_load_number",
                        "value" => "1",
                        "description" => __( "How many extra portfolio items to show when Load More is pressed", 'firstone_domain' )
                    ),
                    array(
                        'type' => 'checkbox',
                        'heading' => __( 'Disable portfolio filter', 'firstone_domain' ),
                        'param_name' => 'nfw_portfolio_filter_disable',
                        'value' => array(__( 'disable', 'firstone_domain' ) => 'yes'),
                        "description" => __( "If you disable portfolio filter, then you won't be able to filter portfolio by portfolio category", 'firstone_domain' )
                    )
                )
            )
    );
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       VC CUSTOM BUTTON FORMATS
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function nfw_button_formats_func( $atts ){
    extract( shortcode_atts( array(
        'nfw_button_formats_link' => '',
        'nfw_button_formats_icon' => '',
        'nfw_button_formats_large' => '',
        'nfw_button_formats_alt' => '',
        'nfw_button_formats_center' => ''
                    ), $atts ) );

    $nfw_button_formats_icon = esc_attr( $nfw_button_formats_icon );
    $link_details = vc_build_link( $nfw_button_formats_link );
    $newtab = "";

    $button_formats_icon = "";
    if( trim( $nfw_button_formats_icon ) != "" ){
        $button_formats_icon = "<i class='{$nfw_button_formats_icon}'></i>";
    }

    $large = $center_before = $center_after = $alt = '';
    if( $nfw_button_formats_large == "large" ){
        $large = " btn-large";
    }

    if( $nfw_button_formats_alt == "alt" ){
        $alt = " alt";
    }

    if( $nfw_button_formats_center == "center" ){
        $center_before = "<div class='text-center'>";
        $center_after = "</div>";
    }

    $link_details['target'] = esc_attr( $link_details['target'] );
    $link_details['url'] = esc_url( $link_details['url'] );
    $link_details['title'] = esc_html( $link_details['title'] );

    if( $link_details['target'] != '' ){
        $newtab = "target='{$link_details['target']}'";
    }

    return "{$center_before}<a class='btn{$large}{$alt}' href='{$link_details['url']}'  {$newtab}>{$button_formats_icon}{$link_details['title']}</a>{$center_after}";
}

add_shortcode( 'nfw_button_formats', 'nfw_button_formats_func' );
add_action( 'init', 'nfw_integrate_vc_button_formats' );

// integrates the custom element in the visual composer
function nfw_integrate_vc_button_formats(){
    vc_map(
            array(
                "name" => __( "Button(s)", 'firstone_domain' ),
                "base" => "nfw_button_formats",
                "category" => __( "Discovery Elements", 'firstone_domain' ),
                "icon" => get_template_directory_uri() . '/framework/admin/images/icons/theme_options_menu_icon.png',
                "params" => array(
                    array(
                        "type" => "vc_link",
                        "heading" => __( "Link title &amp; URL", 'firstone_domain' ),
                        "param_name" => "nfw_button_formats_link",
                        "description" => __( "Specify the link pointing to another page", 'firstone_domain' )
                    ),
                    array(
                        "type" => "nfw_icomoon_icons_param",
                        "heading" => __( "Select icon", 'firstone_domain' ),
                        "param_name" => "nfw_button_formats_icon",
                        "description" => __( "Select the icon you want", 'firstone_domain' )
                    ),
                    array(
                        'type' => 'checkbox',
                        'heading' => __( 'Button Size', 'firstone_domain' ),
                        'param_name' => 'nfw_button_formats_large',
                        'value' => array(__( 'Large', 'firstone_domain' ) => 'large')
                    ),
                    array(
                        'type' => 'checkbox',
                        'heading' => __( 'Alt color', 'firstone_domain' ),
                        'param_name' => 'nfw_button_formats_alt',
                        'value' => array(__( 'Alternative color', 'firstone_domain' ) => 'alt')
                    ),
                    array(
                        'type' => 'checkbox',
                        'heading' => __( 'Button Position', 'firstone_domain' ),
                        'param_name' => 'nfw_button_formats_center',
                        'value' => array(__( 'Center', 'firstone_domain' ) => 'center')
                    )
                )
            )
    );
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       VC CUSTOM TEAM MEMBER ELEMENTS
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// the short code function for the team member elements
function nfw_team_member_func( $atts ){ // New function parameter $content is added!
    extract( shortcode_atts( array(
        'nfw_team_member_name' => '',
        'nfw_team_member_job' => '',
        'nfw_team_member_image' => '',
        'nfw_team_member_pinteres' => '',
        'nfw_team_member_facebook' => '',
        'nfw_team_member_twitter' => '',
        'nfw_team_member_linkedin' => '',
        'nfw_team_member_youtube' => '',
        'nfw_team_member_google_plus' => ''
                    ), $atts ) );

    $team_memeber_info = '';

    $nfw_team_member_name = esc_html( $nfw_team_member_name );
    $nfw_team_member_job = esc_html( $nfw_team_member_job );

    $facebook = $twitter = $googleplus = $linkedin = $youtube = $pinteres = "";

    if( $nfw_team_member_image == null || trim( $nfw_team_member_image ) == '' ){
        $image_url = "";
    } else{
        $nfw_team_member_image = filter_var( $nfw_team_member_image, FILTER_SANITIZE_NUMBER_INT );
        $image_data = wp_get_attachment_image_src( $nfw_team_member_image, 'nfw_image_270_270' );
        $image_url = esc_url( $image_data[0] );
    }

    if( filter_var( $nfw_team_member_google_plus, FILTER_VALIDATE_URL ) ){
        $nfw_team_member_google_plus = esc_url( $nfw_team_member_google_plus );
        $googleplus = "<a class='googleplus-icon social-icon' href='{$nfw_team_member_google_plus}'>
                                <i class='fa fa-google-plus'></i>
                            </a>";
    }

    if( filter_var( $nfw_team_member_pinteres, FILTER_VALIDATE_URL ) ){
        $nfw_team_member_pinteres = esc_url( $nfw_team_member_pinteres );
        $pinteres = "<a class = 'pinterest-icon social-icon' href = '{$nfw_team_member_pinteres}'>
                            <i class = 'fa fa-pinterest'></i>
                        </a>";
    }

    if( filter_var( $nfw_team_member_facebook, FILTER_VALIDATE_URL ) ){
        $nfw_team_member_facebook = esc_url( $nfw_team_member_facebook );
        $facebook = "<a class = 'facebook-icon social-icon' href = '{$nfw_team_member_facebook}'>
                            <i class = 'fa fa-facebook'></i>
                        </a>";
    }

    if( filter_var( $nfw_team_member_twitter, FILTER_VALIDATE_URL ) ){
        $nfw_team_member_twitter = esc_url( $nfw_team_member_twitter );
        $twitter = "<a class = 'twitter-icon social-icon' href = '{$nfw_team_member_twitter}'>
                            <i class = 'fa fa-twitter'></i>
                        </a>";
    }
    if( filter_var( $nfw_team_member_youtube, FILTER_VALIDATE_URL ) ){
        $nfw_team_member_youtube = esc_url( $nfw_team_member_youtube );
        $youtube = "<a class = 'youtube-icon social-icon' href = '{$nfw_team_member_youtube}'>
                            <i class = 'fa fa-youtube'></i>
                        </a>";
    }
    if( filter_var( $nfw_team_member_linkedin, FILTER_VALIDATE_URL ) ){
        $nfw_team_member_linkedin = esc_url( $nfw_team_member_linkedin );
        $linkedin = "<a class = 'linkedin-icon social-icon' href = '{$nfw_team_member_linkedin}'>
                            <i class = 'fa fa-linkedin'></i>
                        </a>";
    }

    $output = "<div class='team-member'>

                            <div class='team-member-preview'>

                                <img src='{$image_url}' alt=''>

                                <div class='team-member-overlay'></div>

                            </div><!-- end .team-member-preview -->

                            <h4><strong>{$nfw_team_member_name}</strong></h4>

                            <p>{$nfw_team_member_job}</p>

                            <div class='team-member-social-media'>

                                <div class='float-right fixed'>

                                    {$facebook}
                                    {$twitter}
                                    {$googleplus}
                                    {$linkedin}
                                    {$youtube}
                                    {$pinteres}

                                </div>

                            </div><!-- end .team-member-social-media -->

                        </div><!-- end .team-member -->";

    return $output;
}

add_shortcode( 'nfw_team_member', 'nfw_team_member_func' );
add_action( 'init', 'nfw_integrate_vc_team_member' );

// integrates the custom element in the visual composer
function nfw_integrate_vc_team_member(){
    vc_map(
            array(
                "name" => __( "Team Member", 'firstone_domain' ),
                "base" => "nfw_team_member",
                "icon" => get_template_directory_uri() . '/framework/admin/images/icons/theme_options_menu_icon.png',
                "category" => __( "Jewel Elements", 'firstone_domain' ),
                "params" => array(
                    array(
                        'type' => 'attach_image',
                        'heading' => __( 'Image', 'firstone_domain' ),
                        'param_name' => 'nfw_team_member_image',
                        'description' => __( 'Add the image of the team member', 'firstone_domain' )
                    ),
                    array(
                        "type" => "textfield",
                        'holder' => 'div',
                        "heading" => __( "Name", 'firstone_domain' ),
                        "param_name" => "nfw_team_member_name",
                        "value" => __( "Sample name", 'firstone_domain' ),
                        "description" => __( "Specify the name of the member", 'firstone_domain' )
                    ),
                    array(
                        "type" => "textfield",
                        "heading" => __( "Job Title", 'firstone_domain' ),
                        "param_name" => "nfw_team_member_job",
                        "value" => __( "Job Title", 'firstone_domain' )
                    ),
                    array(
                        "type" => "textfield",
                        "heading" => __( "Facebook", 'firstone_domain' ),
                        "param_name" => "nfw_team_member_facebook",
                        "value" => "",
                        "description" => __( "Add an optional link to Facebook profile page, leave blank if not available", 'firstone_domain' )
                    ),
                    array(
                        "type" => "textfield",
                        "heading" => __( "Twitter", 'firstone_domain' ),
                        "param_name" => "nfw_team_member_twitter",
                        "value" => "",
                        "description" => __( "Add an optional link to Twitter profile page, leave blank if not available", 'firstone_domain' )
                    ),
                    array(
                        "type" => "textfield",
                        "heading" => __( "Google Plus", 'firstone_domain' ),
                        "param_name" => "nfw_team_member_google_plus",
                        "value" => "",
                        "description" => __( "Add an optional link to Google Plus profile page, leave blank if not available", 'firstone_domain' )
                    ),
                    array(
                        "type" => "textfield",
                        "heading" => __( "Linkedin", 'firstone_domain' ),
                        "param_name" => "nfw_team_member_linkedin",
                        "value" => "",
                        "description" => __( "Add an optional link to Linkedin profile page, leave blank if not available", 'firstone_domain' )
                    ),
                    array(
                        "type" => "textfield",
                        "heading" => __( "Youtube", 'firstone_domain' ),
                        "param_name" => "nfw_team_member_youtube",
                        "value" => "",
                        "description" => __( "Add an optional link to Youtube profile page, leave blank if not available", 'firstone_domain' )
                    ),
                    array(
                        "type" => "textfield",
                        "heading" => __( "Pinteres", 'firstone_domain' ),
                        "param_name" => "nfw_team_member_pinteres",
                        "value" => "",
                        "description" => __( "Add an optional link to Pinteres profile page, leave blank if not available", 'firstone_domain' )
                    )
                )
            )
    );
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       VC CUSTOM PROCESS COMPONENTS ELEMENTS
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function nfw_process_container_func( $atts, $content = null ){ // New function parameter $content is added!
    extract( shortcode_atts( array(
        'nfw_process_extra_container_class' => ''
                    ), $atts ) );

    $content = wpb_js_remove_wpautop( $content, false );
    $content_elements = explode( "<li>", $content );
    $count = count( $content_elements );

    $nfw_process_extra_container_class = esc_attr( $nfw_process_extra_container_class );
    if( trim( $nfw_process_extra_container_class ) ){
        $nfw_process_extra_container_class = ' ' . $nfw_process_extra_container_class;
    } else{
        $nfw_process_extra_container_class = '';
    }

    if( $count <= 4 ){
        $class_part = 'three';
    } else if( $count == 5 ){
        $class_part = 'four';
    } else{
        $class_part = 'five';
    }

    return "<div class='process-builder {$class_part}-items fixed{$nfw_process_extra_container_class}'><ul>{$content}</ul></div>";
}

add_shortcode( 'nfw_process_container', 'nfw_process_container_func' );

function nfw_process_func( $atts, $content = null ){ // New function parameter $content is added!
    extract( shortcode_atts( array(
        'nfw_process_title' => '',
        'nfw_process_icon' => ''
                    ), $atts ) );

    if( trim( $nfw_process_icon ) ){
        $nfw_process_icon = sanitize_html_class( $nfw_process_icon );
        $top_part = "<i class='{$nfw_process_icon}'></i>";
    } else{
        $nfw_process_title = esc_html( $nfw_process_title );
        $top_part = "<h1>{$nfw_process_title}</h1>";
    }

    $content = esc_html( $content );

    $output = "<li>
                    <span>{$top_part}</span>
                    <div class='process-description'>
                            {$content}
                    </div></li>";

    return $output;
}

add_shortcode( 'nfw_process', 'nfw_process_func' );
add_action( 'init', 'nfw_integrate_vc_process_components' );

// integrates the custom element in the visual composer
function nfw_integrate_vc_process_components(){
    vc_map( array(
        "name" => __( "Our Process", "firstone_domain" ),
        "base" => "nfw_process_container",
        "category" => __( "Discovery Elements", 'firstone_domain' ),
        "as_parent" => array('only' => 'nfw_process'), // Use only|except attributes to limit child shortcodes (separate multiple values with comma)
        "content_element" => true,
        "icon" => get_template_directory_uri() . '/framework/admin/images/icons/theme_options_menu_icon.png',
        "show_settings_on_create" => false,
        "params" => array(array(
                "type" => "textfield",
                'holder' => 'div',
                "heading" => __( "Extra Class", 'firstone_domain' ),
                "param_name" => "nfw_process_extra_container_class",
                "value" => '',
                "description" => __( "Specify an optional extra class", 'firstone_domain' )
            )),
        'js_view' => 'VcColumnView'
    ) );
    vc_map( array(
        "name" => __( "Process Step", "firstone_domain" ),
        "base" => "nfw_process",
        "category" => __( "Discovery Elements", 'firstone_domain' ),
        "content_element" => true,
        "icon" => get_template_directory_uri() . '/framework/admin/images/icons/theme_options_menu_icon.png',
        "as_child" => array('only' => 'nfw_process_container'), // Use only|except attributes to limit parent (separate multiple values with comma)
        "params" => array(
            // add params same as with any other content element
            array(
                "type" => "nfw_icomoon_icons_param",
                "heading" => __( "Select icon", 'firstone_domain' ),
                "param_name" => "nfw_process_icon",
                "description" => __( "Select the icon you want", 'firstone_domain' )
            ),
            array(
                "type" => "textfield",
                'holder' => 'div',
                "heading" => __( "Title", "firstone_domain" ),
                "param_name" => "nfw_process_title",
                "value" => __( "Sample title", 'firstone_domain' ),
                "description" => __( "Specify the title of the process", "firstone_domain" )
            ),
            array(
                "type" => "textfield",
                "heading" => __( "Details", 'firstone_domain' ),
                "param_name" => 'content',
                "description" => __( "Specify the details of the process step", 'firstone_domain' )
            )
        )
    ) );
}

if( class_exists( 'WPBakeryShortCodesContainer' ) ){

    class WPBakeryShortCode_nfw_process_container extends WPBakeryShortCodesContainer {
        
    }

}
if( class_exists( 'WPBakeryShortCode' ) ){

    class WPBakeryShortCode_nfw_process extends WPBakeryShortCode {
        
    }

}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       VC POSTS SLIDER ELEMENTS
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function nfw_posts_slider_container_func( $atts, $content = null ){ // New function parameter $content is added!
    extract( shortcode_atts( array(
        'nfw_posts_slider_extra_class' => ''
                    ), $atts ) );

    $content = wpb_js_remove_wpautop( $content, false );

    $nfw_posts_slider_extra_class = esc_attr( $nfw_posts_slider_extra_class );
    if( trim( $nfw_posts_slider_extra_class ) ){
        $nfw_posts_slider_extra_class = ' ' . $nfw_posts_slider_extra_class;
    } else{
        $nfw_posts_slider_extra_class = '';
    }

    return "<div class='blog-post-slider{$nfw_posts_slider_extra_class}'>
                            
                        <ul class='slides'>
                            {$content}
                        </ul>
            </div>";
}

add_shortcode( 'nfw_posts_slider_container', 'nfw_posts_slider_container_func' );

function nfw_posts_slider_func( $atts ){ // New function parameter $content is added!
    extract( shortcode_atts( array(
        'nfw_posts_slider_post' => ''
                    ), $atts ) );

    $post_id = $nfw_posts_slider_post;
    $post_title = esc_html( get_the_title( $post_id ) );
    $post_link = esc_url( get_post_permalink( $post_id ) );

    // gets post excerpt
    global $post;
    $save_post = $post;
    $post = get_post( $post_id );
    setup_postdata( $post );
    $post_excerpt = wp_kses_post( get_the_excerpt() );
    $post = $save_post;

    $image_data = wp_get_attachment_image_src( get_post_thumbnail_id( $post_id ), 'nfw_image_570_680' );
    $image_url = esc_url( $image_data[0] );

    $post_date = get_the_date( 'd M' );
    $post_date_parts = explode( ' ', $post_date );
    $post_date = $post_date_parts[0] . '<br><small>' . $post_date_parts[1] . '</small>';
    $read_more = __( 'read more', 'firstone_domain' );
    $by_text = __( 'Posted By ', 'firstone_domain' );
    $in_text = __( 'in ', 'firstone_domain' );
    $categories = get_the_category( $post_id );
    $category_link = esc_url( get_category_link( $categories[0]->term_id ) );
    $category_name = esc_html( $categories[0]->name );
    $author = esc_html( get_the_author() );

    $output = "<li>
                <div class='blog-post'>

                    <div class='blog-post-thumb'>

                        <img src='{$image_url}' alt=''>

                    </div><!-- end .blog-post-thumb -->

                    <div class='blog-post-title'>

                        <h4>
                            <strong><a href='{$post_link}'>{$post_title}</a></strong>
                        </h4>

                        <h6>
                            <strong>
                                {$by_text}
                                {$author} 
                                {$in_text}
                                <a href='{$category_link}'>{$category_name}</a>
                            </strong>
                        </h6>

                    </div><!-- end .blog-post-title -->

                    <div class='blog-post-info'>

                        <p>{$post_excerpt}</p>

                        <p>
                            <a class='btn text-uppercase' href='{$post_link}'>{$read_more}</a>
                        </p>

                    </div><!-- end .blog-post-info -->

                    <div class='blog-post-date'>

                        {$post_date}

                    </div><!-- end .blog-post-date -->

                </div><!-- end .blog-post -->

    </li>";

    return $output;
}

add_shortcode( 'nfw_posts_slider', 'nfw_posts_slider_func' );
add_action( 'init', 'nfw_integrate_vc_posts_slider_components' );

// integrates the custom element in the visual composer
function nfw_integrate_vc_posts_slider_components(){

    // Constructs an array with the list of custom posts
    $type = 'post';
    $args = array(
        'post_type' => $type,
        'post_status' => 'publish',
        'posts_per_page' => -1,
        'ignore_sticky_posts' => 1);

    $loop = new WP_Query( $args );

    $custom_posts = array();

    while( $loop->have_posts() ){

        $loop->the_post();

        $post_id = get_the_ID();

        $post_title = esc_html( get_the_title( $post_id ) );

        $post_date = esc_html( get_the_time( get_option( 'date_format' ) ) );

        $custom_posts[$post_date . ',  ' . $post_title] = $post_id;
    }

    vc_map( array(
        "name" => __( "Posts Slider Container", "firstone_domain" ),
        "base" => "nfw_posts_slider_container",
        "category" => __( "Discovery Elements", 'firstone_domain' ),
        "as_parent" => array('only' => 'nfw_posts_slider'), // Use only|except attributes to limit child shortcodes (separate multiple values with comma)
        "content_element" => true,
        "icon" => get_template_directory_uri() . '/framework/admin/images/icons/theme_options_menu_icon.png',
        "show_settings_on_create" => false,
        "params" => array(array(
                "type" => "textfield",
                'holder' => 'div',
                "heading" => __( "Extra Class", 'firstone_domain' ),
                "param_name" => "nfw_posts_slider_extra_class",
                "value" => '',
                "description" => __( "Specify an optional extra class", 'firstone_domain' )
            )),
        'js_view' => 'VcColumnView'
    ) );
    vc_map( array(
        "name" => __( "Posts Slider Element", "firstone_domain" ),
        "base" => "nfw_posts_slider",
        "category" => __( "Discovery Elements", 'firstone_domain' ),
        "content_element" => true,
        "icon" => get_template_directory_uri() . '/framework/admin/images/icons/theme_options_menu_icon.png',
        "as_child" => array('only' => 'nfw_posts_slider_container'), // Use only|except attributes to limit parent (separate multiple values with comma)
        "params" => array(
            // add params same as with any other content element
            array(
                'type' => 'dropdown',
                'heading' => __( 'Select Post', 'firstone_domain' ),
                'param_name' => 'nfw_posts_slider_post',
                'value' => $custom_posts
            )
        )
    ) );
}

if( class_exists( 'WPBakeryShortCodesContainer' ) ){

    class WPBakeryShortCode_nfw_posts_slider_container extends WPBakeryShortCodesContainer {
        
    }

}
if( class_exists( 'WPBakeryShortCode' ) ){

    class WPBakeryShortCode_nfw_posts_slider extends WPBakeryShortCode {
        
    }

}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       VC CUSTOM PREVIEWER SLIDER ELEMENTS
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function nfw_previewer_element_func( $atts ){ // New function parameter $content is added!
    extract( shortcode_atts( array(
        'nfw_previewer_title' => '',
        'nfw_previewer_image' => ''
                    ), $atts ) );

    $nfw_previewer_title = esc_html( $nfw_previewer_title );

    if( trim( $nfw_previewer_image ) != '' ){
        $nfw_image_id = filter_var( $nfw_previewer_image, FILTER_SANITIZE_NUMBER_INT );
        $image_data = wp_get_attachment_image_src( $nfw_image_id, 'nfw_image_860_540' );
        $image_url = esc_url( $image_data[0] );
    }

    $output = $nfw_previewer_title . 'nfwpreviewerseaprator' . $image_url . 'nfwpreviewerseaprator';

    return $output;
}

add_shortcode( 'nfw_previewer_element', 'nfw_previewer_element_func' );

function nfw_previewer_container_func( $atts, $content = null ){ // New function parameter $content is added!
    extract( shortcode_atts( array(
        'nfw_previewer_container_image' => ''
                    ), $atts ) );

    $content = wpb_js_remove_wpautop( $content, false );

    $parts = explode( 'nfwpreviewerseaprator', $content );
    $count = count( $parts ) - 1;
    $j = 1;
    if( isset( $parts[1] ) ){
        $head_nav = "<div class='nfw-row'>
                            <div class='nfw-span12'>
                                <ul class='buttons'>";
        $images_part = "</ul></div></div>
                        <div class='nfw-row'>
                            <div class='nfw-span12'>
                                <div class='features-slider'>
                                    <ul class='slides'>";

        for( $i = 0; $i < $count; $i++ ){
            if( $i != 0 ){
                $head_nav.="<li><a class='btn' href='#' data-slide='{$j}'>{$parts[$i]}</a></li>";
            } else{
                $head_nav.="<li><a class='btn active' href='#' data-slide='{$j}'>{$parts[$i]}</a></li>";
            }
            $i++;
            $images_part.="<li><img src='{$parts[$i]}' alt=''></li>";
            $j++;
        }
        if( trim( $nfw_previewer_container_image ) != '' ){
            $nfw_image_id = filter_var( $nfw_previewer_container_image, FILTER_SANITIZE_NUMBER_INT );
            $image_data = wp_get_attachment_image_src( $nfw_image_id, 'full' );
            $image_url = esc_url( $image_data[0] );
        } else{
            $image_url = esc_url( get_template_directory_uri() . '/layout/images/default/laptop.png' );
        }

        $background_previwer = "<div class='nfw-row'><div class='nfw-span12'><img class='bg-features-slider' src='{$image_url}' alt=''></div></div>";

        return $head_nav . $images_part . '</ul></div></div></div>' . $background_previwer . '<div class="previwer_end"></div>';
    } else
        return 'no content for the previwer';
}

add_shortcode( 'nfw_previewer_container', 'nfw_previewer_container_func' );

add_action( 'init', 'nfw_integrate_vc_previewer_components' );

// integrates the custom element in the visual composer
function nfw_integrate_vc_previewer_components(){
    vc_map( array(
        "name" => __( "Previewer", "firstone_domain" ),
        "base" => "nfw_previewer_container",
        "category" => __( "Discovery Elements", 'firstone_domain' ),
        "as_parent" => array('only' => 'nfw_previewer_element'), // Use only|except attributes to limit child shortcodes (separate multiple values with comma)
        "content_element" => true,
        "icon" => get_template_directory_uri() . '/framework/admin/images/icons/theme_options_menu_icon.png',
        "show_settings_on_create" => false,
        "params" => array(array(
                "type" => "attach_image",
                "heading" => __( "Container Image", 'firstone_domain' ),
                "param_name" => "nfw_previewer_container_image",
                "description" => __( "Chose an image or the default one will be used", 'firstone_domain' )
            )),
        'js_view' => 'VcColumnView'
    ) );

    vc_map(
            array(
                "name" => __( "Previwer Element", 'firstone_domain' ),
                "base" => "nfw_previewer_element",
                "icon" => get_template_directory_uri() . '/framework/admin/images/icons/theme_options_menu_icon.png',
                "category" => __( "Discovery Elements", 'firstone_domain' ),
                "as_child" => array('only' => 'nfw_previewer_container'),
                "params" => array(
                    array(
                        "type" => "textfield",
                        'holder' => 'div',
                        "heading" => __( "Title", 'firstone_domain' ),
                        "param_name" => "nfw_previewer_title",
                        "value" => __( "Sample title", 'firstone_domain' ),
                        "description" => __( "Specify a title", 'firstone_domain' )
                    ),
                    array(
                        'type' => 'attach_image',
                        'heading' => __( 'Image', 'firstone_domain' ),
                        'param_name' => 'nfw_previewer_image',
                        'description' => __( 'Add an image', 'firstone_domain' )
                    )
                )
            )
    );
}

if( class_exists( 'WPBakeryShortCodesContainer' ) ){

    class WPBakeryShortCode_nfw_previewer_container extends WPBakeryShortCodesContainer {
        
    }

}
if( class_exists( 'WPBakeryShortCode' ) ){

    class WPBakeryShortCode_nfw_previewer_element extends WPBakeryShortCode {
        
    }

}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       VC CUSTOM TESTIMONIAL SLIDER ELEMENTS
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function nfw_testimonial_element_func( $atts, $content = null ){ // New function parameter $content is added!
    extract( shortcode_atts( array(
        'nfw_testimonial_name' => '',
        'nfw_testimonial_image' => ''
                    ), $atts ) );

    $content = esc_html( $content );
    $nfw_testimonial_name = esc_html( $nfw_testimonial_name );

    $image_area = '';
    if( trim( $nfw_testimonial_image ) != '' ){
        $nfw_image_id = filter_var( $nfw_testimonial_image, FILTER_SANITIZE_NUMBER_INT );

        $image_data = wp_get_attachment_image_src( $nfw_image_id, 'nfw_image_70_70' );
        $image_url = esc_url( $image_data[0] );

        $image_area = "<img src='{$image_url}' alt=''>";
    }

    $output = "<li><div class='headline nfw-testimonial'>

                    <h1>{$nfw_testimonial_name}</h1>

                </div><!--end .headline -->

            <div class='testimonial'>

                    <blockquote>
                    <p>{$content}</p>
                    </blockquote>

                    {$image_area}

            </div></li>";

    return $output;
}

add_shortcode( 'nfw_testimonial_element', 'nfw_testimonial_element_func' );

function nfw_testimonial_slider_container_func( $atts, $content = null ){ // New function parameter $content is added!
    extract( shortcode_atts( array(
        'nfw_testimonial_slider_extra_class' => ''
                    ), $atts ) );

    $content = wpb_js_remove_wpautop( $content, false );

    $nfw_testimonial_slider_extra_class = esc_attr( $nfw_testimonial_slider_extra_class );
    if( trim( $nfw_testimonial_slider_extra_class ) ){
        $nfw_testimonial_slider_extra_class = ' ' . $nfw_testimonial_slider_extra_class;
    } else{
        $nfw_testimonial_slider_extra_class = '';
    }

    return "<div class='client-testimonials-slider{$nfw_testimonial_slider_extra_class}'>
            	
                <ul class='slides'>
                            {$content}
                </ul>
                        
            </div>";
}

add_shortcode( 'nfw_testimonial_slider_container', 'nfw_testimonial_slider_container_func' );

//add_shortcode( 'nfw_testimonial_slider', 'nfw_testimonial_slider_func' );
add_action( 'init', 'nfw_integrate_vc_testimonial_slider_components' );

// integrates the custom element in the visual composer
function nfw_integrate_vc_testimonial_slider_components(){
    vc_map( array(
        "name" => __( "Testimonial Slider Container", "firstone_domain" ),
        "base" => "nfw_testimonial_slider_container",
        "category" => __( "Discovery Elements", 'firstone_domain' ),
        "as_parent" => array('only' => 'nfw_testimonial_element'), // Use only|except attributes to limit child shortcodes (separate multiple values with comma)
        "content_element" => true,
        "icon" => get_template_directory_uri() . '/framework/admin/images/icons/theme_options_menu_icon.png',
        "show_settings_on_create" => false,
        "params" => array(array(
                "type" => "textfield",
                'holder' => 'div',
                "heading" => __( "Extra Class", 'firstone_domain' ),
                "param_name" => "nfw_testimonial_slider_extra_class",
                "value" => '',
                "description" => __( "Specify an optional extra class", 'firstone_domain' )
            )),
        'js_view' => 'VcColumnView'
    ) );

    vc_map(
            array(
                "name" => __( "Testimonial", 'firstone_domain' ),
                "base" => "nfw_testimonial_element",
                "icon" => get_template_directory_uri() . '/framework/admin/images/icons/theme_options_menu_icon.png',
                "category" => __( "Discovery Elements", 'firstone_domain' ),
                "as_child" => array('only' => 'nfw_testimonial_slider_container'),
                "params" => array(
                    array(
                        "type" => "textfield",
                        'holder' => 'div',
                        "heading" => __( "Name", 'firstone_domain' ),
                        "param_name" => "nfw_testimonial_name",
                        "value" => __( "Sample name", 'firstone_domain' ),
                        "description" => __( "Specify the name of the testimonial author", 'firstone_domain' )
                    ),
                    array(
                        "type" => "textarea",
                        "heading" => __( "Testimonial", 'firstone_domain' ),
                        "param_name" => "content",
                        "value" => "",
                        "description" => __( "Specify the text of the testimonial", 'firstone_domain' )
                    ),
                    array(
                        'type' => 'attach_image',
                        'heading' => __( 'Image', 'firstone_domain' ),
                        'param_name' => 'nfw_testimonial_image',
                        'description' => __( 'Add an image for the testimonial', 'firstone_domain' )
                    )
                )
            )
    );
}

if( class_exists( 'WPBakeryShortCodesContainer' ) ){

    class WPBakeryShortCode_nfw_testimonial_slider_container extends WPBakeryShortCodesContainer {
        
    }

}
if( class_exists( 'WPBakeryShortCode' ) ){

    class WPBakeryShortCode_nfw_testimonial_element extends WPBakeryShortCode {
        
    }

}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       VC CUSTOM HEADLINE ELEMENTS
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// the short code function for the headline elements
function nfw_headlines_func( $atts ){
    extract( shortcode_atts( array(
        'nfw_headline_title' => '',
        'nfw_headline_details' => ''
                    ), $atts ) );

    $nfw_headline_title = esc_html( $nfw_headline_title );
    $specifications_elements = mb_split( '<br />', $nfw_headline_details );
    $specifications_list = $title = $details = '';

    $end = end( $specifications_elements );
    // Loops through each specifications row
    foreach( $specifications_elements as $element ){
        $element = esc_html( $element );
        $specifications_list.=$element;

        // Places this div after each loop element except the last one
        if( $element != esc_html( $end ) ){
            $specifications_list.= "<br class='hidden-tablet hidden-phone'>";
        }
    }

    if( trim( $nfw_headline_title ) != '' ){
        $title = "<h1>{$nfw_headline_title}</h1>";
    }

    if( trim( $specifications_list ) != '' ){
        $details = "<h5>{$specifications_list}</h5>";
    }

    $output = "<div class='headline'>
                        {$title}
                        {$details}
                    </div>";

    return $output;
}

add_shortcode( 'nfw_headlines', 'nfw_headlines_func' );
add_action( 'init', 'nfw_integrate_vc_headlines' );

// integrates the custom element in the visual composer
function nfw_integrate_vc_headlines(){
    vc_map(
            array(
                "name" => __( "HeadLine", 'firstone_domain' ),
                "base" => "nfw_headlines",
                "icon" => get_template_directory_uri() . '/framework/admin/images/icons/theme_options_menu_icon.png',
                "category" => __( "Essence Elements", 'firstone_domain' ),
                "params" => array(
                    array(
                        "type" => "textfield",
                        'holder' => 'div',
                        "heading" => __( "Title", 'firstone_domain' ),
                        "param_name" => "nfw_headline_title",
                        "value" => __( "Sample title", 'firstone_domain' ),
                        "description" => __( "Specify the text of the headline", 'firstone_domain' )
                    ),
                    array(
                        "type" => "textarea",
                        "heading" => __( "Details", 'firstone_domain' ),
                        "param_name" => "nfw_headline_details",
                        "value" => __( "Sample details field from here", 'firstone_domain' ),
                        "description" => __( "Specify the detailed text of the headline", 'firstone_domain' )
                    )
                )
            )
    );
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       VC CUSTOM TWITTER ELEMENTS
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function nfw_twitter_component_func( $atts ){
    extract( shortcode_atts( array(
        'nfw_twitter_id' => '',
        'nfw_twitter_count' => ''
                    ), $atts ) );

    $nfw_twitter_count = absint( $nfw_twitter_count );
    $nfw_twitter_id = esc_attr( $nfw_twitter_id );
    $tweeter_container_id = esc_attr( uniqid() );
    
    $twitter_image = esc_url( get_template_directory_uri() . '/layout/images/twitter.png' );

    $output = "<div class='nfw-row'><div class='nfw-span12 text-center'><img src='{$twitter_image}' alt=''></div></div>
                <div id='{$tweeter_container_id}' class='twitter-slider nfw_component_latest_tweets'>
                        <div class='nfw-component-tweet-list' data-account-id='{$nfw_twitter_id}' data-items='{$nfw_twitter_count}' data-container-id='{$tweeter_container_id}'></div>
                </div>";

    return $output;
}

add_shortcode( 'nfw_twitter_component', 'nfw_twitter_component_func' );
add_action( 'init', 'nfw_integrate_vc_twitter_component' );

// integrates the custom element in the visual composer
function nfw_integrate_vc_twitter_component(){
    vc_map(
            array(
                "name" => __( "Latest tweets", 'firstone_domain' ),
                "base" => "nfw_twitter_component",
                "icon" => get_template_directory_uri() . '/framework/admin/images/icons/theme_options_menu_icon.png',
                "category" => __( "Essence Elements", 'firstone_domain' ),
                "params" => array(
                    array(
                        "type" => "textfield",
                        'holder' => 'div',
                        "heading" => __( "ID", 'firstone_domain' ),
                        "param_name" => "nfw_twitter_id",
                        "description" => __( "Specify the twitter user id", 'firstone_domain' )
                    ),
                    array(
                        "type" => "textfield",
                        'holder' => 'div',
                        "heading" => __( "Number of tweets", 'firstone_domain' ),
                        "param_name" => "nfw_twitter_count",
                        "value" => '3',
                        "description" => __( "Specify the number of tweets", 'firstone_domain' )
                    ),
                )
            )
    );
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       VC CUSTOM Latest Posts ELEMENTS
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function nfw_portfolio_latest_func( $atts ){ // New function parameter $content is added!
    extract( shortcode_atts( array(
        'nfw_latest_posts_count' => ''
                    ), $atts ) );

    $type = 'post';
    $args = array(
        'post_type' => $type,
        'post_status' => 'publish',
        'posts_per_page' => $nfw_latest_posts_count,
        'ignore_sticky_posts' => 1);

    $loop = new WP_Query( $args );
    $output = "<div class='blog-post-slider'>
                    <div class='nfw-row'>
                        <div class='nfw-span12'>
                            <ul class='slides'>";

    while( $loop->have_posts() ){

        $terms_class = "item";
        $loop->the_post();
        $post_id = get_the_ID();

        $post_excerpt = wp_kses_post( get_the_excerpt() );
        // $post = $save_post;

        $image_data = wp_get_attachment_image_src( get_post_thumbnail_id( $post_id ), 'nfw_image_570_680' );
        $image_url = esc_url( $image_data[0] );
        $post_title = esc_html( get_the_title() );
        $post_link = esc_url( get_permalink() );
        $post_date = get_the_date( 'd M' );
        $post_date_parts = explode( ' ', $post_date );
        $post_date = $post_date_parts[0] . '<br><small>' . $post_date_parts[1] . '</small>';
        $read_more = __( 'read more', 'firstone_domain' );
        $by_text = __( 'Posted By ', 'firstone_domain' );
        $in_text = __( 'in ', 'firstone_domain' );
        $categories = get_the_category( $post_id );
        $category_link = esc_url( get_category_link( $categories[0]->term_id ) );
        $category_name = esc_html( $categories[0]->name );
        $author = esc_html( get_the_author() );

        $output.= "<li>
                <div class='blog-post'>

                    <div class='blog-post-thumb'>

                        <img src='{$image_url}' alt=''>

                    </div><!-- end .blog-post-thumb -->

                    <div class='blog-post-title'>

                        <h4>
                            <strong><a href='{$post_link}'>{$post_title}</a></strong>
                        </h4>

                        <h6>
                            <strong>
                                {$by_text}
                                {$author} 
                                {$in_text}
                                <a href='{$category_link}'>{$category_name}</a>
                            </strong>
                        </h6>

                    </div><!-- end .blog-post-title -->

                    <div class='blog-post-info'>

                        <p>{$post_excerpt}</p>

                        <p>
                            <a class='btn text-uppercase' href='{$post_link}'>{$read_more}</a>
                        </p>

                    </div><!-- end .blog-post-info -->
                    
                    <div class='blog-post-low'>
                    <p>{$post_title}</p>
                    <p><a class='btn text-uppercase' href='{$post_link}'>{$read_more}</a></p>
                    </div>

                    <div class='blog-post-date'>

                        {$post_date}

                    </div><!-- end .blog-post-date -->

                </div><!-- end .blog-post -->

    </li>";
    }
    $output.="</ul></div></div></div>";
    return $output;
}

add_shortcode( 'nfw_portfolio_latest', 'nfw_portfolio_latest_func' );
add_action( 'init', 'nfw_integrate_vc_portfolio_latest_components' );

// integrates the custom element in the visual composer
function nfw_integrate_vc_portfolio_latest_components(){

    vc_map( array(
        "name" => __( "Recent Posts", "firstone_domain" ),
        "base" => "nfw_portfolio_latest",
        "category" => __( "Essence Elements", 'firstone_domain' ),
        "content_element" => true,
        "icon" => get_template_directory_uri() . '/framework/admin/images/icons/theme_options_menu_icon.png',
        "params" => array(
            // add params same as with any other content element
            array(
                "type" => "textfield",
                "heading" => __( "Number of posts", 'firstone_domain' ),
                "param_name" => "nfw_latest_posts_count",
                "value" => "3",
                'holder' => 'div',
                'description' => __( 'Specify the number of posts you want in the slider', 'firstone_domain' )
            )
        )
    ) );
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       VC CUSTOM ANIMATIONS SLIDER ELEMENTS
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function nfw_animations_container_func( $atts, $content = null ){ // New function parameter $content is added!
    extract( shortcode_atts( array(
        'nfw_animate_type' => '',
        'nfw_animate_delay' => '',
        'nfw_animate_speed' => '',
        'nfw_animate_offset' => ''
                    ), $atts ) );

    $content = wpb_js_remove_wpautop( $content, false );
    $nfw_animate_type = esc_attr( $nfw_animate_type );
    $nfw_animate_delay = absint( $nfw_animate_delay );
    $nfw_animate_speed = absint( $nfw_animate_speed );
    $nfw_animate_offset = absint( $nfw_animate_offset );
    if( $nfw_animate_offset > 100 ){
        $nfw_animate_offset = 90;
    }

    return "<div class='animate' data-animation='{$nfw_animate_type}' data-animation-delay='{$nfw_animate_delay}' data-animation-speed'='{$nfw_animate_speed}' data-animation-offset='{$nfw_animate_offset}%'>
                            {$content}
            </div>";
}

add_shortcode( 'nfw_animations_container', 'nfw_animations_container_func' );
add_action( 'init', 'nfw_integrate_vc_animations_container_component' );

// integrates the custom element in the visual composer
function nfw_integrate_vc_animations_container_component(){
    vc_map( array(
        "name" => __( "Animations Container", "firstone_domain" ),
        "base" => "nfw_animations_container",
        "category" => __( "Discovery Elements", 'firstone_domain' ),
        "as_parent" => array('except' => ''), // Use only|except attributes to limit child shortcodes (separate multiple values with comma)
        "content_element" => true,
        // "icon" => get_template_directory_uri() . '/framework/admin/images/icons/theme_options_menu_icon.png',
        "show_settings_on_create" => true,
        "params" => array(
            array(
                'type' => 'dropdown',
                'holder' => 'div',
                'heading' => __( 'Animation Type', 'firstone_domain' ),
                'param_name' => 'nfw_animate_type',
                'value' => array(
                    __( 'bounce', 'firstone_domain' ) => 'bounce',
                    __( 'flash', 'firstone_domain' ) => 'flash',
                    __( 'pulse', 'firstone_domain' ) => 'pulse',
                    __( 'rubberBand', 'firstone_domain' ) => 'rubberBand',
                    __( 'shake', 'firstone_domain' ) => 'shake',
                    __( 'swing', 'firstone_domain' ) => 'swing',
                    __( 'tada', 'firstone_domain' ) => 'tada',
                    __( 'wobble', 'firstone_domain' ) => 'wobble',
                    __( 'bounceIn', 'firstone_domain' ) => 'bounceIn',
                    __( 'bounceInDown', 'firstone_domain' ) => 'bounceInDown',
                    __( 'bounceInLeft', 'firstone_domain' ) => 'bounceInLeft',
                    __( 'bounceInRight', 'firstone_domain' ) => 'bounceInRight',
                    __( 'bounceInUp', 'firstone_domain' ) => 'bounceInUp',
                    __( 'bounceOut', 'firstone_domain' ) => 'bounceOut',
                    __( 'bounceOutDown', 'firstone_domain' ) => 'bounceOutDown',
                    __( 'bounceOutLeft', 'firstone_domain' ) => 'bounceOutLeft',
                    __( 'bounceOutRight', 'firstone_domain' ) => 'bounceOutRight',
                    __( 'bounceOutUp', 'firstone_domain' ) => 'bounceOutUp',
                    __( 'fadeIn', 'firstone_domain' ) => 'fadeIn',
                    __( 'fadeInDown', 'firstone_domain' ) => 'fadeInDown',
                    __( 'fadeInDownBig', 'firstone_domain' ) => 'fadeInDownBig',
                    __( 'fadeInLeft', 'firstone_domain' ) => 'fadeInLeft',
                    __( 'fadeInLeftBig', 'firstone_domain' ) => 'fadeInLeftBig',
                    __( 'fadeInRight', 'firstone_domain' ) => 'fadeInRight',
                    __( 'fadeInRightBig', 'firstone_domain' ) => 'fadeInRightBig',
                    __( 'fadeInUp', 'firstone_domain' ) => 'fadeInUp',
                    __( 'fadeInUpBig', 'firstone_domain' ) => 'fadeInUpBig',
                    __( 'fadeOut', 'firstone_domain' ) => 'fadeOut',
                    __( 'fadeOutDown', 'firstone_domain' ) => 'fadeOutDown',
                    __( 'fadeOutDownBig', 'firstone_domain' ) => 'fadeOutDownBig',
                    __( 'fadeOutLeft', 'firstone_domain' ) => 'fadeOutLeft',
                    __( 'fadeOutLeftBig', 'firstone_domain' ) => 'fadeOutLeftBig',
                    __( 'fadeOutRight', 'firstone_domain' ) => 'fadeOutRight',
                    __( 'fadeOutRightBig', 'firstone_domain' ) => 'fadeOutRightBig',
                    __( 'fadeOutUp', 'firstone_domain' ) => 'fadeOutUp',
                    __( 'fadeOutUpBig', 'firstone_domain' ) => 'fadeOutUpBig',
                    __( 'flip', 'firstone_domain' ) => 'flip',
                    __( 'flipInX', 'firstone_domain' ) => 'flipInX',
                    __( 'flipInY', 'firstone_domain' ) => 'flipInY',
                    __( 'flipOutX', 'firstone_domain' ) => 'flipOutX',
                    __( 'flipOutY', 'firstone_domain' ) => 'flipOutY',
                    __( 'lightSpeedIn', 'firstone_domain' ) => 'lightSpeedIn',
                    __( 'lightSpeedOut', 'firstone_domain' ) => 'lightSpeedOut',
                    __( 'rotateIn', 'firstone_domain' ) => 'rotateIn',
                    __( 'rotateInDownLeft', 'firstone_domain' ) => 'rotateInDownLeft',
                    __( 'rotateInDownRight', 'firstone_domain' ) => 'rotateInDownRight',
                    __( 'rotateInUpLeft', 'firstone_domain' ) => 'rotateInUpLeft',
                    __( 'rotateInUpRight', 'firstone_domain' ) => 'rotateInUpRight',
                    __( 'rotateOut', 'firstone_domain' ) => 'rotateOut',
                    __( 'rotateOutDownLeft', 'firstone_domain' ) => 'rotateOutDownLeft',
                    __( 'rotateOutDownRight', 'firstone_domain' ) => 'rotateOutDownRight',
                    __( 'rotateOutUpLeft', 'firstone_domain' ) => 'rotateOutUpLeft',
                    __( 'rotateOutUpRight', 'firstone_domain' ) => 'rotateOutUpRight',
                    __( 'hinge', 'firstone_domain' ) => 'hinge',
                    __( 'rollIn', 'firstone_domain' ) => 'rollIn',
                    __( 'rollOut', 'firstone_domain' ) => 'rollOut',
                    __( 'zoomIn', 'firstone_domain' ) => 'zoomIn',
                    __( 'zoomInDown', 'firstone_domain' ) => 'zoomInDown',
                    __( 'zoomInLeft', 'firstone_domain' ) => 'zoomInLeft',
                    __( 'zoomInRight', 'firstone_domain' ) => 'zoomInRight',
                    __( 'zoomInUp', 'firstone_domain' ) => 'zoomInUp',
                    __( 'zoomOut', 'firstone_domain' ) => 'zoomOut',
                    __( 'zoomOutDown', 'firstone_domain' ) => 'zoomOutDown',
                    __( 'zoomOutLeft', 'firstone_domain' ) => 'zoomOutLeft',
                    __( 'zoomOutRight', 'firstone_domain' ) => 'zoomOutRight',
                    __( 'zoomOutUp', 'firstone_domain' ) => 'zoomOutUp'
                ),
                'description' => __( 'Specify', 'firstone_domain' )
            ),
            array(
                "type" => "textfield",
                "heading" => __( "Animation Delay", 'firstone_domain' ),
                "param_name" => "nfw_animate_delay",
                "value" => '0',
                "description" => __( "Specify the delay amount", 'firstone_domain' )
            ),
            array(
                "type" => "textfield",
                "heading" => __( "Animation Speed", 'firstone_domain' ),
                "param_name" => "nfw_animate_speed",
                "value" => '1000',
                "description" => __( "Specify the delay amount(in milliseconds, 1000 milliseconds = 1 second)", 'firstone_domain' )
            ),
            array(
                "type" => "textfield",
                "heading" => __( "Animation Offset", 'firstone_domain' ),
                "param_name" => "nfw_animate_offset",
                "value" => '90',
                "description" => __( "Specify the Offset amount (in percentage from 0 to 100)", 'firstone_domain' )
            )
        ),
        'js_view' => 'VcColumnView') );
}

if( class_exists( 'WPBakeryShortCodesContainer' ) ){

    class WPBakeryShortCode_nfw_animations_container extends WPBakeryShortCodesContainer {
        
    }

}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       VC CUSTOM nfw 
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Removes some visual composer elements
vc_remove_element( "vc_progress_bar" );
vc_remove_element( "vc_pie" );
vc_remove_element( "vc_message" );
//vc_remove_element( "vc_gmaps" );

// Creates the full-width row checkbox option
$anchor_id = array(
    'type' => 'textfield',
    'heading' => __( 'Row ID', 'firstone_domain' ),
    'param_name' => 'nfw_row_anchor',
    'description' => __( 'Allows you to give the row an ID. Useful when creating the navigation. Please add ID without the #', 'firstone_domain' )
);
vc_add_param( 'vc_row', $anchor_id );

// Creates the full-width row checkbox option
$attributes_full_width = array(
    'type' => 'checkbox',
    'heading' => __( 'Spread full width', 'firstone_domain' ),
    'param_name' => 'nfw_row_full_width',
    'description' => __( 'Full Width', 'firstone_domain' ),
    'value' => array
        (__( 'Yes', 'firstone_domain' ) => 'yes')
);
vc_add_param( 'vc_row', $attributes_full_width );

// Creates the parallax checkbox option
$parallax_checkbox = array(
    'type' => 'checkbox',
    'heading' => __( 'Add parallax effect to this section', 'firstone_domain' ),
    'param_name' => 'nfw_row_parallax',
    'description' => __( 'Parallax', 'firstone_domain' ),
    'value' => array(__( 'Parallax', 'firstone_domain' ) => 'yes')
);
vc_add_param( 'vc_row', $parallax_checkbox );

// Changes vc rows and columns classes
function nfw_custom_css_classes_for_vc_row_clumn( $class_string, $tag ){
    if( $tag == 'vc_row' || $tag == 'vc_row_inner' ){
        $class_string = str_replace( 'vc_row-fluid', '', $class_string );
        $class_string = str_replace( 'vc_inner ', '', $class_string );
        $class_string = str_replace( 'wpb_row', '', $class_string );
        $class_string = str_replace( 'vc_row ', '', $class_string );
    }

    if( $tag == 'vc_column' || $tag == 'vc_column_inner' ){
        $class_string = preg_replace( '/vc_col-sm-(\d{1,2})/', 'nfw-span$1', $class_string );
        $class_string = str_replace( ' wpb_column vc_column_container', '', $class_string );
    }

    return $class_string;
}

// Filter to Replace default css class for vc_row shortcode and vc_column
add_filter( 'vc_shortcodes_css_class', 'nfw_custom_css_classes_for_vc_row_clumn', 10, 2 );

// Generates the form inputs related to icomoon icons
function nfw_icomoon_icons_param_settings_field( $settings, $value ){
    $dependency = vc_generate_dependencies_attributes( $settings );
    // Gets the list of icons
    $icons_list = nfw_icons_listing();

    return '<div class="nfw_fa_icons_param_block">
            <div class="nfw_icon_container"><span class="' . sanitize_html_class( $value ) . '" id="nfw_selected_icon"></span></div>
            <input id="nfw_icon_input" name="' . esc_attr( $settings ['param_name'] )
            . '" class="icon_input wpb_vc_param_value wpb-textinput '
            . esc_attr( $settings['param_name'] ) . ' ' . esc_attr( $settings['type'] ) . '_field" type="text" value="'
            . esc_attr( $value ) . '" ' . esc_html( $dependency ) . ' onchange="nfw_selected_icon_display()" />
            <button class="vc_btn vc_btn-primary" onclick="nfw_icon_clear_selection()" >Clear</button>
            <br><div id="nfw_icons_list">'
            . $icons_list
            . '</div></div>';
}

add_shortcode_param( 'nfw_icomoon_icons_param', 'nfw_icomoon_icons_param_settings_field' );

// Generates the form inputs related to font awesome icons
function nfw_fa_icons_param_settings_field( $settings, $value ){
    $dependency = vc_generate_dependencies_attributes( $settings );
    return '<div class="nfw_fa_icons_param_block">
            <i class="' . sanitize_html_class( $value ) . '" id="nfw_selected_icon"></i>
            <input id="nfw_icon_input" name="' . esc_attr( $settings ['param_name'] )
            . '" class="wpb_vc_param_value wpb-textinput '
            . sanitize_html_class( $settings['param_name'] ) . ' ' . sanitize_html_class( $settings['type'] ) . '_field" type="text" value="'
            . esc_attr( $value ) . '" ' . esc_html( $dependency ) . ' size="10" />
            <br><div id="nfw_icons_list_fa">
            <i class="fa fa-facebook" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-twitter" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-dribbble" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-pinterest" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-google-plus" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-tumblr" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-instagram" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-rss" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-linkedin" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-skype" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-flickr" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-vimeo-square" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-github" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-youtube" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-windows" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-dropbox" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-xing" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-adn" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-android" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-apple" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-behance" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-bitbucket" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-bitcoin" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-codepen" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-css3" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-delicious" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-deviantart" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-digg" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-drupal" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-empire" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-foursquare" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-git" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-gittip" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-hacker-news" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-html5" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-joomla" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-jsfiddle" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-linux" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-maxcdn" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-openid" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-pagelines" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-pied-piper" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-qq" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-rebel" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-reddit" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-renren" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-share" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-slack" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-soundcloud" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-spotify" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-stack-exchange" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-stack-overflow" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-steam" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-stumbleupon" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-tencent-weibo" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-trello" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-vine" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-vk" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-wechat" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-weibo" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-wordpress" onclick="nfw_icon_change(this)"></i>
            <i class="fa fa-yahoo" onclick="nfw_icon_change(this)"></i>
            </div></div>';
}

add_shortcode_param( 'nfw_fa_icons_param', 'nfw_fa_icons_param_settings_field' );
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//                       END OF VISUAL COMPOSER RELATED OPERATIONS
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////