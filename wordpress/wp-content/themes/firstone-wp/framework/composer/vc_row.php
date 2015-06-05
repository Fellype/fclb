<?php

$el_class = $bg_image = $bg_color = $bg_image_repeat = $font_color = $padding = $nfw_row_parallax = $nfw_row_full_width = $margin_bottom = $css = '';
extract( shortcode_atts( array(
    'el_class' => '',
    'bg_image' => '',
    'bg_color' => '',
    'bg_image_repeat' => '',
    'font_color' => '',
    'padding' => '',
    'margin_bottom' => '',
    'nfw_row_full_width' => '',
    'nfw_row_parallax' => '',
    'nfw_row_anchor' => '',
    'nfw_row_images' => '',
    'css' => ''
                ), $atts ) );

wp_enqueue_script( 'wpb_composer_front_js' );

$el_class = $this->getExtraClass( $el_class );
$anchor_id='';
$css_class = apply_filters( VC_SHORTCODE_CUSTOM_CSS_FILTER_TAG, 'vc_row wpb_row ' . ( $this->settings( 'base' ) === 'vc_row_inner' ? 'vc_inner ' : '' ) . get_row_css_class() . $el_class . vc_shortcode_custom_css_class( $css, ' ' ), $this->settings['base'], $atts );
$css_class_parts = explode( ' ', $css_class );
$style = $this->buildStyle( $bg_image, $bg_color, $bg_image_repeat, $font_color, $padding, $margin_bottom );
if(trim($nfw_row_anchor)!=''){
    $anchor_id='id='.sanitize_html_class($nfw_row_anchor).' ';
}
if( $nfw_row_parallax == 'yes' ){
    echo '<div class="fullwidth-section parallax';
    foreach( $css_class_parts as $css_class_part ){
        if( trim( sanitize_html_class( $css_class_part ) ) != '' ){
            echo ' ' . sanitize_html_class( $css_class_part );
        }
    }
    echo '"' . wp_kses_post( $style ) . '>';
    echo '<div '.esc_attr($anchor_id).'class="nfw-row">';
} else if( $nfw_row_full_width == 'yes' ){
    echo '<div class="fullwidth-section';
    foreach( $css_class_parts as $css_class_part ){
        if( trim( sanitize_html_class( $css_class_part ) ) != '' ){
            echo ' ' . sanitize_html_class( $css_class_part );
        }
    }
    echo '"' . wp_kses_post( $style ) . '>';
    echo '<div '.esc_attr($anchor_id).'class="nfw-row">';
} else{
    echo '<div '.esc_attr($anchor_id).'class="nfw-row';
    foreach( $css_class_parts as $css_class_part ){
        if( trim( sanitize_html_class( $css_class_part ) ) != '' ){
            echo ' ' . sanitize_html_class( $css_class_part );
        }
    }
    echo '"' . wp_kses_post( $style ) . '>';
}
echo wpb_js_remove_wpautop( $content );
if( $nfw_row_parallax == 'yes' || $nfw_row_full_width == 'yes' ){
    echo '</div>';
}
echo '</div>';
