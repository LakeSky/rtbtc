$(document).ready(function(){	   
	$('.breadcrumb').find('a').last().addClass('last');
	$('ul').each(function (ul) {
		$(this).find('li').first().addClass('first');
		$(this).find('li').last().addClass('last');
	});
	$('.cat_panel > ul').each(function (cat_panel) {
		$(this).find(' > li').last().addClass('last');
	});			
	$('.menu').each(function (menu) {
		$(this).find('a').first().addClass('first');
		$(this).find('a').last().addClass('last');
	});
	$('.contentBlock').each(function (contentText) {
		$(this).find('.contentText').first().addClass('first');
		$(this).find('.contentText').last().addClass('last');
	});
	$('#cartContent').each(function (contentCheckoutCart) {
		$(this).find('.contentCheckoutCart').first().addClass('first');
		$(this).find('.contentCheckoutCart').last().addClass('last');
	});
	$('.qtpro tr').each(function (qtpro) {
		$(this).find('td, th').first().addClass('first');
		$(this).find('td, th').last().addClass('last');
	});
	$('.contentBlock h3').first().addClass('first_h3');
	$('.contentBlock.loginPage h3').addClass('first_h3');
	$('.contentInfoText, .contentInfoBlock').last().addClass('marg-bottom');
	$('.loginPage .contentInfoText').addClass('marg-top');
	
	$('.cart th').last().css('border-right','0px');
	$('.cart_prods').css('border-width','0px 1px 1px 0px');
	$('.cart_update').css('border-width','0px 1px 1px 0px');
	$('.cart_price').css('border-width','0px 0px 1px 0px');	
	$('.cart_total td:nth-child(2)').css('border-width','0px 1px 0px 0px');

	$('#piGal, .grid_view, .row_view, ul#stringball, #back-top, .bannershow_block img').css('visibility','visible');
	// hide #back-top first
	$("#back-top").hide();
	// fade in #back-top
	$(function () {
		$(window).scroll(function () {
			if ($(this).scrollTop() > 100) {
				$('#back-top').fadeIn();
			} else {
				$('#back-top').fadeOut();
			}
		});
		// scroll body to 0px on click
		$('#back-top a').click(function () {
			$('body,html').animate({
				scrollTop: 0
			}, 800);
			return false;
		});
	});
		// drop down languages in header
	$(function(){
		 var keeper=$('#box_languages'),
				 langLi=$('#box_languages li').css({opacity:0,	display: 'none'})
				 langPic=$('#box_languages li img').css({})
		 keeper
			.bind('mouseover',function(){
				langLi.parent().stop()
				.css('display', 'block');
			 	langLi.stop()
			 .css('display', 'block')
			 .animate({
				opacity: 1
			}, 800);
			})
			.bind('mouseleave',function(){
				langLi.parent().stop()
				.css('display', 'none');
				langLi
			 .stop()
			 .animate({opacity:0})
			 .css('display', 'none') 
			}); 
	});
		// drop down currencies in header	
	$(function(){
		 var keeper=$('#box_currencies'),
				 langLi=$('#box_currencies li').css({opacity:0,	display: 'none'})
				 langPic=$('#box_currencies li img').css({})
		 keeper
			.bind('mouseover',function(){
				langLi.parent().stop()
				.css('display', 'block');
			 	langLi.stop()
			 .css('display', 'block')
			 .animate({
				opacity: 1
			}, 800);
			})
			.bind('mouseleave',function(){
				langLi.parent().stop()
				.css('display', 'none');
				langLi
			 .stop()
			 .animate({opacity:0})
			 .css('display', 'none') 
			}); 
	});
		// Product Image for Product info page.
	$(function(){
		 var keeper=$('.page_products_info .wrapper_pic_div'),
				 zoomPic=$('.pic_zoom').css({opacity:0})
		 keeper
			.bind('mouseenter',function(){
			 zoomPic.stop()
			 .animate({
				opacity: 1
			}, 800);
		
			})
			.bind('mouseleave',function(){
			zoomPic
			 .stop()
			 .animate({
				opacity: 0
			}, 400);
			}); 
	});
	$('#tabvanilla > ul').tabs({ fx: { height: 'toggle', opacity: 'toggle' } });
	$('#tabvanilla_nested > ul').tabs({ fx: { height: 'toggle', opacity: 'toggle' } });	
	$('#tabvanilla_pinfo > ul').tabs({ fx: { height: 'toggle', opacity: 'toggle' } });	

});
