'use strict';

// ajax related functions and calls
jQuery(document).ready(function ($) {

    // The ajax call was triggered by a portfolio Load More button
    $(".nfw_load_more_trigger").click(function () {

        // Stores the relevant data from the fields in variables
        var count_increment = $(this).attr("data-count_increment");
        var count_total = $(this).attr("data-count_total");
        var custom_post_type = $(this).attr("data-custom_post_type");
        var target_container = $(this).attr("data-target_container");
        var nonce = $(this).attr("data-nonce");
        var load_more_id = this.id;

        $.ajax({
            type: "post",
            dataType: "json",
            url: nfw_ajax.ajaxurl,
            data: {action: "nfw_custom_posts_isotope", count_total: count_total, custom_post_type: custom_post_type, nonce: nonce},
            success: function (response) {
                    // Clears the content of the portfolio
                    var container = $("#" + target_container);
                    // Clear the portfolio content and insert the elements
                    container.html('');
                    container.html(response.list_elements);
                    $("#" + target_container).imagesLoaded(function () {

                        // Reload Isotope for the portfolio
                        jQuery("#" + target_container).isotope('reloadItems').isotope({sortBy: 'original-order'});
                    });
                if (response.content_elements == 0) {
                    document.getElementById(load_more_id).style.display = 'none';
                }
            },
            error: function (response) {
                console.log(response);
            }

        });

        count_total = parseInt(count_total, 10) + parseInt(count_increment, 10);
        $(this).attr("data-count_total", count_total);

        return false;
    });

});

function nfw_iframe_popup(obj) {
   var post_src = jQuery(obj).attr("data-portfolio_post_src");

        jQuery.magnificPopup.open({
            items: {
                src: '<div title="Close (Esc)" class="nfw-close-iframe" onclick="nfw_close()">×</div>\n\
<iframe frameborder="0" scrolling="no" onload="javascript:nfw_resizeIframe(this);" \n\
class="project-wrap" src="' + post_src + '" name="iframe_a"></iframe>',
                type: 'inline'
            }
        });
        return false;
  }

function nfw_resizeIframe(obj) {
   obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
  }

// easy way to close the iframe via Magnific popup's functions
function nfw_close () {
    jQuery( ".mfp-bg.mfp-ready" ).trigger( "click" );
}