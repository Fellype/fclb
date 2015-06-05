'use strict';

jQuery(document).ready(function () {

    jQuery(function (jQuery) {

        jQuery('.nfw_custom_image_upload_trigger').click(function () {
            // The upload Header image button was triggered
            var formfield = jQuery(this).siblings('.custom_upload_image');
            var preview = jQuery(this).siblings('.custom_preview_image');

            // Show the media image selection WordPress frame
            tb_show('', 'media-upload.php?type=image&TB_iframe=true');
            window.send_to_editor = function (html) {
                var imgurl = jQuery('img', html).attr('src');
                var classes = jQuery('img', html).attr('class');
                var id = classes.replace(/(.*?)wp-image-/, '');
                formfield.val(id);
                preview.attr('src', imgurl);
                if (document.getElementById('header_image_upload_input').value != '') {
                    document.getElementById('nfw_custom_clear_image_button').style.display = 'inline-block';
                }
                tb_remove();

            }
            return false;
        });

        if (jQuery("#nfw_preview_header_image").length > 0) {
            if (document.getElementById('header_image_upload_input').value == '') {
                document.getElementById('nfw_custom_clear_image_button').style.display = 'none';
            }
        }

        jQuery('#nfw_custom_clear_image_button').click(function () {
            // Removes the uploaded header image from the preview and the input fields
            document.getElementById('header_image_upload_input').value = '';
            document.getElementById('nfw_preview_header_image').src = nfw_default_header["nfw_default_header"];
            document.getElementById('nfw_custom_clear_image_button').style.display = 'none';
            return false;
        });

    });
});