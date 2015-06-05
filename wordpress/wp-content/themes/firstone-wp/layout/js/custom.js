var container_id;
(function($) {
	
	"use strict";
	
/* ==========================================================================
   ieViewportFix - fixes viewport problem in IE 10 SnapMode and IE Mobile 10
   ========================================================================== */
   
	function ieViewportFix() {
	
		var msViewportStyle = document.createElement("style");
		
		msViewportStyle.appendChild(
			document.createTextNode(
				"@-ms-viewport { width: device-width; }"
			)
		);

		if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
			
			msViewportStyle.appendChild(
				document.createTextNode(
					"@-ms-viewport { width: auto !important; }"
				)
			);
		}
		
		document.getElementsByTagName("head")[0].
			appendChild(msViewportStyle);

	}

/* ==========================================================================
   exists - Check if an element exists
   ========================================================================== */		
	
	function exists(e) {
		return $(e).length > 0;
	}

/* ==========================================================================
   isTouchDevice - return true if it is a touch device
   ========================================================================== */

	function isTouchDevice() {
		return !!('ontouchstart' in window) || ( !! ('onmsgesturechange' in window) && !! window.navigator.maxTouchPoints);
	}

/* ==========================================================================
   setDimensionsPieCharts
   ========================================================================== */
	
	function setDimensionsPieCharts() {

		$(".pie-chart").each(function() {

			var $t = $(this);
			var n = $t.parent().width();
			var r = $t.attr("data-barSize");
			
			if (n < r) {
				r = n;
			}
			
			$t.css("height", r);
			$t.css("width", r);
			$t.css("line-height", r + "px");
			
			$t.find("i").css({
				"line-height": r + "px",
				"font-size": r / 3
			});
			
		});

	}

/* ==========================================================================
   animatePieCharts
   ========================================================================== */

	function animatePieCharts() {

		if(typeof $.fn.easyPieChart != 'undefined'){

			$(".pie-chart:in-viewport").each(function() {
	
				var $t = $(this);
				var n = $t.parent().width();
				var r = $t.attr("data-barSize");
				
				if (n < r) {
					r = n;
				}
				
				$t.easyPieChart({
					animate: 1300,
					lineCap: "square",
					lineWidth: $t.attr("data-lineWidth"),
					size: r,
					barColor: $t.attr("data-barColor"),
					trackColor: $t.attr("data-trackColor"),
					scaleColor: "transparent",
					onStep: function(from, to, percent) {
						$(this.el).find('.pie-chart-percent span').text(Math.round(percent));
					}
	
				});
				
			});
			
		}

	}

/* ==========================================================================
   animateMilestones
   ========================================================================== */

	function animateMilestones() {

		$(".milestone:in-viewport").each(function() {
			
			var $t = $(this);
			var	n = $t.find(".milestone-value").attr("data-stop");
			var	r = parseInt($t.find(".milestone-value").attr("data-speed"));
				
			if (!$t.hasClass("already-animated")) {
				$t.addClass("already-animated");
				$({
					countNum: $t.find(".milestone-value").text()
				}).animate({
					countNum: n
				}, {
					duration: r,
					easing: "linear",
					step: function() {
						$t.find(".milestone-value").text(Math.floor(this.countNum));
					},
					complete: function() {
						$t.find(".milestone-value").text(this.countNum);
					}
				});
			}
			
		});

	}

/* ==========================================================================
   animateProgressBars
   ========================================================================== */

	function animateProgressBars() {

		$(".progress-bar .progress-bar-outer:in-viewport").each(function() {
			
			var $t = $(this);
			
			if (!$t.hasClass("already-animated")) {
				$t.addClass("already-animated");
				$t.animate({
					width: $t.attr("data-width") + "%"
				}, 2000);
			}
			
		});

	}

/* ==========================================================================
   enableParallax
   ========================================================================== */

	function enableParallax() {

		if(typeof $.fn.parallax != 'undefined'){
			
			$('.parallax').each(function() {
	
				var $t = $(this);
				$t.addClass("parallax-enabled");
				$t.parallax("49%", 0, false);
	
			});
			
		}

	}

/* ==========================================================================
   handleMobileMenu 
   ========================================================================== */		

	var MOBILEBREAKPOINT = 979;

	function handleMobileMenu() {

		if ((exists("#menu")) && ($(window).width() > MOBILEBREAKPOINT)) {
			
			$("#mobile-menu").hide();
			$("#mobile-menu-trigger").removeClass("mobile-menu-opened").addClass("mobile-menu-closed");
		
		} else {
			
			if (!exists("#mobile-menu")) {
				
				$("#menu").clone().attr({
					id: "mobile-menu",
					"class": "fixed"
				}).insertAfter("#header");
				
				$("#mobile-menu > li > a, #mobile-menu > li > ul > li > a").each(function() {
					var $t = $(this);
					if ($t.next().hasClass('sub-menu') || $t.next().is('ul')) {
						$t.append('<span class="fa fa-angle-down mobile-menu-submenu-arrow mobile-menu-submenu-closed"></span>');
					}
				});
			
				$(".mobile-menu-submenu-arrow").click(function(event) {
					var $t = $(this);
					if ($t.hasClass("mobile-menu-submenu-closed")) {
						$t.parent().siblings("ul").slideDown(300);
						$t.removeClass("mobile-menu-submenu-closed fa-angle-down").addClass("mobile-menu-submenu-opened fa-angle-up");
					} else {
						$t.parent().siblings("ul").slideUp(300);
						$t.removeClass("mobile-menu-submenu-opened fa-angle-up").addClass("mobile-menu-submenu-closed fa-angle-down");
					}
					event.preventDefault();
				});
				
				$("#mobile-menu li, #mobile-menu li a, #mobile-menu ul").attr("style", "");
				
			}
			
		}

	}

/* ==========================================================================
   showHideMobileMenu
   ========================================================================== */

	function showHideMobileMenu() {
		
		if (exists('#mobile-menu-trigger')) {
		
			$("#mobile-menu-trigger").click(function(event) {
				
				var $t = $(this);
				var $n = $("#mobile-menu");
				
				if ($t.hasClass("mobile-menu-opened")) {
					$t.removeClass("mobile-menu-opened").addClass("mobile-menu-closed");
					$n.slideUp(300);
				} else {
					$t.removeClass("mobile-menu-closed").addClass("mobile-menu-opened");
					$n.slideDown(300);
				}
				event.preventDefault();
				
			});
		
		}
		
	}

/* ==========================================================================
   handleBackToTop
   ========================================================================== */
   
   function handleBackToTop() {
	   
		$('#back-to-top').click(function(){
			$('html, body').animate({scrollTop:0}, 'slow');
			return false;
		});
   
   }
   	
/* ==========================================================================
   showHidebackToTop
   ========================================================================== */	
	
	function showHidebackToTop() {
	
		if ($(window).scrollTop() > $(window).height() / 2 ) {
			$("#back-to-top").removeClass('gone');
			$("#back-to-top").addClass('visible');
		} else {
			$("#back-to-top").removeClass('visible');
			$("#back-to-top").addClass('gone');
		}
	
	}
	
/* ==========================================================================
   handlePageLoader
   ========================================================================== */	
	
	function handlePageLoader() {	
		
		var hash = window.location.hash;
		
		$(".loader-img").delay(500).fadeOut();
		$("#pageloader").delay(1000).fadeOut("slow");
		
		if(!hash) { 
			// Do nothing //
		} else {
			$(document).scrollTop( $(hash).offset().top -56); 
		}
	}
	
// -------------------------------------------------------------------------------------------------------
//  handleFullScreenDiv
// -------------------------------------------------------------------------------------------------------
	
	function handleFullScreenDiv() {
	
		var x = $(window).height();
		
		$('.full-screen').css("height", x + "px");
		
	}

// -------------------------------------------------------------------------------------------------------
//  handleChangeLogo
// -------------------------------------------------------------------------------------------------------
	
	function handleChangeLogo() {
		
		if ($('#header').hasClass('stuck'))
			$('#logo img').attr('src', nfw_links['logo-sticky-link'] );	
		else
			$('#logo img').attr('src', nfw_links['logo-header-link'] );	
			
	}

// -------------------------------------------------------------------------------------------------------
//  handleSmoothScrolling
// -------------------------------------------------------------------------------------------------------
	
	function handleSmoothScrolling() {
	
		$('a[href*=#]:not([href=#])').click(function() {
			if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
			  var target = $(this.hash);
			  target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
			  if (target.length) {
				$('html,body').animate({
				  scrollTop: target.offset().top
				}, 700);
				return false;
			  }
			}
		});
	}
	
/* ==========================================================================
   handleMenu
   ========================================================================== */	
	
	function handleMenu() {
	
		$(document).on('click', 'a.menu-collaps', function(event){
			event.preventDefault();
			var navigation = $('#nav-menu'),
				$t = $(this);
	
			$('body').toggleClass('cbp-spmenu-push-toleft');
			navigation.toggleClass('cbp-spmenu-open');
		});
	
		$(document).on('click', 'a.close-menu', function(event){
			event.preventDefault();
			var $t = $(this),
				$mcollaps = $('a.menu-collaps');
	
			$t.closest('#nav-menu').toggleClass('cbp-spmenu-open');
			$mcollaps.show();
			$('body').toggleClass('cbp-spmenu-push-toleft');
	
		});	
		
	}
	
// -------------------------------------------------------------------------------------------------------
//  handleStickyHeader
// -------------------------------------------------------------------------------------------------------
	
	function handleStickyHeader() {
	
		var b = document.documentElement,
        	e = false,
       		a = $(window).height();

		function f() {
			
			window.addEventListener("scroll", function (h) {
				
				if (!e) {
					e = true;
					setTimeout(d, 250);
				}
			}, false);
			
			window.addEventListener("load", function (h) {
				
				if (!e) {
					e = true;
					setTimeout(d, 250);
				}
			}, false);
		}
	
		function d() {
			
			var h = c();
			
			if (h >= a) {
				$('#header').addClass("stuck");
			} else {
				$('#header').removeClass("stuck");
			}
			
			e = false;
		}
	
		function c() {
			
			return window.pageYOffset || b.scrollTop;
			
		}
		
		f();
		
	}



/* ==========================================================================
   When document is ready, do
   ========================================================================== */
   
	$(document).ready(function() {	
            
            if(typeof twitterFetcher !== 'undefined' && ($('.nfw_widget_latest_tweets').length > 0)) {
			
			$('.nfw_widget_latest_tweets').each(function(index){
			
				var account_id = $('.nfw-tweet-list', this).attr('data-account-id'),
					items = $('.nfw-tweet-list', this).attr('data-items'),
					newID = 'nfw-tweet-list-' + index;
				
				$('.nfw-tweet-list', this).attr('id', newID);
				
				var config = {
				  "id": account_id,
				  "domId": newID,
				  "maxTweets": items,
                                  "showTime": false,
                                  "showUser": false,
				};
				
				twitterFetcher.fetch(config);
			});
			
		}
		
		ieViewportFix();
		
		setDimensionsPieCharts();
		
		animatePieCharts();
		animateMilestones();
		animateProgressBars();

		if (!isTouchDevice()) {
			enableParallax();
		}
		
		handleMobileMenu();
		showHideMobileMenu();
		
		handleBackToTop();
		showHidebackToTop();
		
		handleFullScreenDiv();
		
		handleSmoothScrolling();
		
		handleMenu();
		
		handleStickyHeader();

		handleChangeLogo();
		
		// simplePlaceholder - polyfill for mimicking the HTML5 placeholder attribute using jQuery
		// https://github.com/marcgg/Simple-Placeholder/blob/master/README.md
		
		if(typeof $.fn.simplePlaceholder != 'undefined'){
			
			$('input[placeholder], textarea[placeholder]').simplePlaceholder();
		
		}
		
		// Fitvids - fluid width video embeds
		// https://github.com/davatron5000/FitVids.js/blob/master/README.md
		
		if(typeof $.fn.fitVids != 'undefined'){
			
			$('.fitvids').fitVids();
		
		}
		
		// Superfish - enhance pure CSS drop-down menus
		// http://users.tpg.com.au/j_birch/plugins/superfish/options/
		
		if(typeof $.fn.superfish != 'undefined'){
			
			$('#menu').superfish({
				delay: 100,
				animation: {opacity:'show',height:'show'},
				speed: 100,
				cssArrows: false
			});
			
		}
		
		// bxSlider - responsive slider
		// http://bxslider.com/options
		
		if(typeof $.fn.bxSlider != 'undefined'){
			
			$('.bxslider .slides').bxSlider({
				 mode: 'fade',							// Type of transition between slides: 'horizontal', 'vertical', 'fade'		
				 speed: 500,							// Slide transition duration (in ms)
				 infiniteLoop: true,					// If true, clicking "Next" while on the last slide will transition to the first slide and vice-versa.
				 hideControlOnEnd: false,				// If true, "Next" control will be hidden on last slide and vice-versa. Only used when infiniteLoop: false
				 pager: true,							// If true, a pager will be added
				 pagerType: 'full',						// If 'full', a pager link will be generated for each slide. If 'short', a x / y pager will be used (ex. 1/5)
				 controls: true,						// If true, "Next" / "Prev" controls will be added
				 auto: true,							// If true, slides will automatically transition
				 pause: 4000,							// The amount of time (in ms) between each auto transition
				 autoHover: true,						// Auto show will pause when mouse hovers over slider
				 useCSS: false 							// If true, CSS transitions will be used for animations. False, jQuery animations. Setting to false fixes problem with jQuery 2.1.0 and mode:horizontal
			});
			
			/* Client Testimonials Slider */
			
			$('.client-testimonials-slider .slides').bxSlider({
				 mode: 'fade',							// Type of transition between slides: 'horizontal', 'vertical', 'fade'		
				 speed: 500,							// Slide transition duration (in ms)
				 infiniteLoop: true,					// If true, clicking "Next" while on the last slide will transition to the first slide and vice-versa.
				 hideControlOnEnd: false,				// If true, "Next" control will be hidden on last slide and vice-versa. Only used when infiniteLoop: false
				 pager: true,							// If true, a pager will be added
				 pagerType: 'full',						// If 'full', a pager link will be generated for each slide. If 'short', a x / y pager will be used (ex. 1/5)
				 controls: false,						// If true, "Next" / "Prev" controls will be added
				 auto: true,							// If true, slides will automatically transition
				 pause: 4000,							// The amount of time (in ms) between each auto transition
				 autoHover: true,						// Auto show will pause when mouse hovers over slider
				 useCSS: false 							// If true, CSS transitions will be used for animations. False, jQuery animations. Setting to false fixes problem with jQuery 2.1.0 and mode:horizontal
			});
			
			/* Clients Slider */
			
			$('.clients-slider .slides').bxSlider({
				 mode: 'horizontal',					// Type of transition between slides: 'horizontal', 'vertical', 'fade'		
				 speed: 500,							// Slide transition duration (in ms)
				 infiniteLoop: true,					// If true, clicking "Next" while on the last slide will transition to the first slide and vice-versa.
				 hideControlOnEnd: false,				// If true, "Next" control will be hidden on last slide and vice-versa. Only used when infiniteLoop: false
				 pager: false,							// If true, a pager will be added
				 pagerType: 'full',						// If 'full', a pager link will be generated for each slide. If 'short', a x / y pager will be used (ex. 1/5)
				 controls: true,						// If true, "Next" / "Prev" controls will be added
				 auto: true,							// If true, slides will automatically transition
				 pause: 4000,							// The amount of time (in ms) between each auto transition
				 autoHover: true,						// Auto show will pause when mouse hovers over slider
				 useCSS: false,							// If true, CSS transitions will be used for animations. False, jQuery animations. Setting to false fixes problem with jQuery 2.1.0 and mode:horizontal
				 slideWidth: 145,
				 minSlides: 2,
				 maxSlides: 7,
				 moveSlides: 1,
				 slideMargin: 5
			});
			
			/* Blog Post Slider */
			
			$('.blog-post-slider .slides').bxSlider({
				 mode: 'horizontal',					// Type of transition between slides: 'horizontal', 'vertical', 'fade'		
				 speed: 500,							// Slide transition duration (in ms)
				 infiniteLoop: true,					// If true, clicking "Next" while on the last slide will transition to the first slide and vice-versa.
				 hideControlOnEnd: false,				// If true, "Next" control will be hidden on last slide and vice-versa. Only used when infiniteLoop: false
				 pager: false,							// If true, a pager will be added
				 pagerType: 'full',						// If 'full', a pager link will be generated for each slide. If 'short', a x / y pager will be used (ex. 1/5)
				 controls: true,						// If true, "Next" / "Prev" controls will be added
				 auto: false,							// If true, slides will automatically transition
				 pause: 4000,							// The amount of time (in ms) between each auto transition
				 autoHover: true,						// Auto show will pause when mouse hovers over slider
				 useCSS: false,							// If true, CSS transitions will be used for animations. False, jQuery animations. Setting to false fixes problem with jQuery 2.1.0 and mode:horizontal
				 slideWidth: 570,
				 minSlides: 1,
				 maxSlides: 2,
				 moveSlides: 1,
				 slideMargin: 20
			});
			
			$('.blog-post-slider-2 .slides').bxSlider({
				 mode: 'horizontal',					// Type of transition between slides: 'horizontal', 'vertical', 'fade'		
				 speed: 500,							// Slide transition duration (in ms)
				 infiniteLoop: true,					// If true, clicking "Next" while on the last slide will transition to the first slide and vice-versa.
				 hideControlOnEnd: false,				// If true, "Next" control will be hidden on last slide and vice-versa. Only used when infiniteLoop: false
				 pager: false,							// If true, a pager will be added
				 pagerType: 'full',						// If 'full', a pager link will be generated for each slide. If 'short', a x / y pager will be used (ex. 1/5)
				 controls: true,						// If true, "Next" / "Prev" controls will be added
				 auto: false,							// If true, slides will automatically transition
				 pause: 4000,							// The amount of time (in ms) between each auto transition
				 autoHover: true,						// Auto show will pause when mouse hovers over slider
				 useCSS: false,							// If true, CSS transitions will be used for animations. False, jQuery animations. Setting to false fixes problem with jQuery 2.1.0 and mode:horizontal
				 slideWidth: 370,
				 minSlides: 1,
				 maxSlides: 3,
				 moveSlides: 1,
				 slideMargin: 20
			});	
			
			/* Features Slider */
			
			var features_slider = $('.features-slider .slides').bxSlider({
				 mode: 'vertical',						// Type of transition between slides: 'horizontal', 'vertical', 'fade'		
				 speed: 500,							// Slide transition duration (in ms)
				 infiniteLoop: true,					// If true, clicking "Next" while on the last slide will transition to the first slide and vice-versa.
				 hideControlOnEnd: false,				// If true, "Next" control will be hidden on last slide and vice-versa. Only used when infiniteLoop: false
				 pager: false,							// If true, a pager will be added
				 pagerType: 'full',						// If 'full', a pager link will be generated for each slide. If 'short', a x / y pager will be used (ex. 1/5)
				 controls: false,						// If true, "Next" / "Prev" controls will be added
				 auto: false,							// If true, slides will automatically transition
				 pause: 4000,							// The amount of time (in ms) between each auto transition
				 autoHover: true,						// Auto show will pause when mouse hovers over slider
				 useCSS: false 							// If true, CSS transitions will be used for animations. False, jQuery animations. Setting to false fixes problem with jQuery 2.1.0 and mode:horizontal
			});
			
			$('.buttons li a').each(function() {
				
				$(this).click(function() {
					
					var x = $(this).attr("data-slide");
					
					$('.buttons li a').removeClass('active');
					$(this).addClass('active');
					
					features_slider.goToSlide(x-1);
					return false;

				})
                
            });

		}
				
		// Magnific PopUp - responsive lightbox
		// http://dimsemenov.com/plugins/magnific-popup/documentation.html
		
		if(typeof $.fn.magnificPopup != 'undefined'){
		
			$('.magnificPopup').magnificPopup({
				disableOn: 400,
				closeOnContentClick: true,
				type: 'image'
			});
                        
                       /* $('.open-popup-link').magnificPopup({
                            type:'inline',
                            midClick: true // Allow opening popup on middle mouse click. Always set it to true if you don't provide alternative source in href.
                          });*/
			
			$('.magnificPopup-gallery').magnificPopup({
				disableOn: 400,
				type: 'image',
				gallery: {
					enabled: true
				}
			});
		
			$('#portfolio .ajax-popup-link').magnificPopup({
				type: 'ajax',
				closeOnContentClick: false,
				closeOnBgClick: false,
				gallery: {
					enabled: true
				},
				callbacks: {
					ajaxContentAdded: function(){
						
						// Portfolio Slides
						
						$('.portfolio-slider .slides').bxSlider({
							 mode: 'horizontal',					// Type of transition between slides: 'horizontal', 'vertical', 'fade'		
							 speed: 500,							// Slide transition duration (in ms)
							 infiniteLoop: true,					// If true, clicking "Next" while on the last slide will transition to the first slide and vice-versa.
							 hideControlOnEnd: false,				// If true, "Next" control will be hidden on last slide and vice-versa. Only used when infiniteLoop: false
							 pager: true,							// If true, a pager will be added
							 pagerType: 'full',						// If 'full', a pager link will be generated for each slide. If 'short', a x / y pager will be used (ex. 1/5)
							 controls: false,						// If true, "Next" / "Prev" controls will be added
							 auto: true,							// If true, slides will automatically transition
							 pause: 4000,							// The amount of time (in ms) between each auto transition
							 autoHover: true,						// Auto show will pause when mouse hovers over slider
							 useCSS: false 							// If true, CSS transitions will be used for animations. False, jQuery animations. Setting to false fixes problem with jQuery 2.1.0 and mode:horizontal
						});
						
						// Blog Post Slides
						
						$('.blog-post-slider-3 .slides').bxSlider({
							 mode: 'horizontal',					// Type of transition between slides: 'horizontal', 'vertical', 'fade'		
							 speed: 500,							// Slide transition duration (in ms)
							 infiniteLoop: true,					// If true, clicking "Next" while on the last slide will transition to the first slide and vice-versa.
							 hideControlOnEnd: false,				// If true, "Next" control will be hidden on last slide and vice-versa. Only used when infiniteLoop: false
							 pager: true,							// If true, a pager will be added
							 pagerType: 'full',						// If 'full', a pager link will be generated for each slide. If 'short', a x / y pager will be used (ex. 1/5)
							 controls: false,						// If true, "Next" / "Prev" controls will be added
							 auto: true,							// If true, slides will automatically transition
							 pause: 4000,							// The amount of time (in ms) between each auto transition
							 autoHover: true,						// Auto show will pause when mouse hovers over slider
							 useCSS: false 							// If true, CSS transitions will be used for animations. False, jQuery animations. Setting to false fixes problem with jQuery 2.1.0 and mode:horizontal
						});
						
						ieViewportFix();
						animateProgressBars();
						
						$('.mfp-wrap').scroll(function() {
							
							animateProgressBars();
							
						})
					}
				}
			});
			
			$('#blog .ajax-popup-link').magnificPopup({
				type: 'ajax',
				closeOnContentClick: false,
				closeOnBgClick: false,
				gallery: {
					enabled: true
				},
				callbacks: {
					ajaxContentAdded: function(){
						
						// Blog Post Slides
						
						$('.blog-post-slider-3 .slides').bxSlider({
							 mode: 'horizontal',					// Type of transition between slides: 'horizontal', 'vertical', 'fade'		
							 speed: 500,							// Slide transition duration (in ms)
							 infiniteLoop: true,					// If true, clicking "Next" while on the last slide will transition to the first slide and vice-versa.
							 hideControlOnEnd: false,				// If true, "Next" control will be hidden on last slide and vice-versa. Only used when infiniteLoop: false
							 pager: true,							// If true, a pager will be added
							 pagerType: 'full',						// If 'full', a pager link will be generated for each slide. If 'short', a x / y pager will be used (ex. 1/5)
							 controls: false,						// If true, "Next" / "Prev" controls will be added
							 auto: true,							// If true, slides will automatically transition
							 pause: 4000,							// The amount of time (in ms) between each auto transition
							 autoHover: true,						// Auto show will pause when mouse hovers over slider
							 useCSS: false 							// If true, CSS transitions will be used for animations. False, jQuery animations. Setting to false fixes problem with jQuery 2.1.0 and mode:horizontal
						});
					}
				}
			});
		
		}
		
		// twitterFetcher
		// http://jasonmayes.com/projects/twitterApi/
		
		if(typeof twitterFetcher !== 'undefined' && ($('.nfw_component_latest_tweets').length > 0)) {
			
			$('.nfw_component_latest_tweets').each(function(index){
			
				var account_id = $('.nfw-component-tweet-list', this).attr('data-account-id'),
					items = $('.nfw-component-tweet-list', this).attr('data-items'),
                                        container = $('.nfw-component-tweet-list', this).attr('data-container-id'),
					newID = 'nfw-component-tweet-list-' + index;
				
				$('.nfw-component-tweet-list', this).attr('id', newID);
                                container_id=container;
				var config = {
				  "id": account_id,
				  "domId": newID,
				  "maxTweets": items,
                                  "showTime": false,
                                  "showUser": false,
                                 "customCallback": handleTweets,
				};
				
				twitterFetcher.fetch(config);
			});
			
		}
		// Isotope - portfolio filtering
		// http://isotope.metafizzy.co/beta/
		
		if(typeof $.fn.isotope != 'undefined'){
			
			$('.portfolio-items').imagesLoaded( function() {
			
				var container = $('.portfolio-items');
					
				container.isotope({
					itemSelector: '.item',
					layoutMode: 'masonry',
					transitionDuration: '0.5s'
				});
		
				$('.portfolio-filter li a').click(function () {
					$('.portfolio-filter li a').removeClass('active');
					$(this).addClass('active');
		
					var selector = $(this).attr('data-filter');
					container.isotope({
						filter: selector
					});
		
					return false;
				});
		
				$(window).resize(function () {
		
					container.isotope({ });
				
				});
				
			});
			
		}
		
		// ScollSpy
		
		if(typeof $.fn.scrollspy != 'undefined'){
			
			$('body').scrollspy({
				target: '#header'
			});
	
		}	
		
	});

/* ==========================================================================
   When the window is scrolled, do
   ========================================================================== */
   
	$(window).scroll(function() {				   
		
		animateMilestones();
		animatePieCharts();
		animateProgressBars();
		
		showHidebackToTop();
		
		handleStickyHeader();
		
		handleChangeLogo();

	});

/* ==========================================================================
   When the window is resized, do
   ========================================================================== */
   
	$(window).resize(function() {
		
		handleMobileMenu();
		
		handleFullScreenDiv();
		
	});
	
/* ==========================================================================
   When the window is loading, do
   ========================================================================== */
	
	$(window).load(function() {
		
		handlePageLoader();
		
		handleStickyHeader();
		
		handleChangeLogo();
		
	});

})(window.jQuery);

// non jQuery scripts below