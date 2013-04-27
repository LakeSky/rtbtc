/*
 * Url preview script 
 * powered by jQuery (http://www.jquery.com)
 * 
 * written by Alen Grakalic (http://cssglobe.com)
 * 
 * for more info visit http://cssglobe.com/post/1695/easiest-tooltip-and-image-preview-using-jquery
 *
 */
screenshotPreview = function(){	
	/* CONFIG */
		xOffset = -100;
		yOffset = -300;
		// these 2 variable determine popup's distance from the cursor
		// you might want to adjust to get the right result
	/* END CONFIG */
	$(".sf-menu li a").hover(function(e){
		var tc=$(this)
		if	($(this).data('rel'))	{
			$(".cat_panel").append("<p id='screenshot'><img src='"+ tc.data('rel') +"' alt='' /><span>"+tc.data('desc')+"</span></p>");
			$("#screenshot").slideDown(500);
			//	.css("top",(e.pageY - xOffset) + "px")
			//	.css("left",(e.pageX + yOffset) + "px")
		}
    },
	function(){
		$(".cat_panel #screenshot").remove();
    });	
	$(".sf-menu li a").mousemove(function(e){
		$("#screenshot")
		//	.css("top",(e.pageY - xOffset) + "px")
		//	.css("left",(e.pageX + yOffset) + "px");
	});			
};
// starting the script on page load
$(document).ready(function(){
	screenshotPreview();
});
// ++++++++++++++++++++++++++++++++++++++++++++++++++++=
screenshotPreviewCategory = function(){
		xOffset = 123;
		yOffset = -9;
	$(".infoBoxContents ul li a").hover(function(e2){
	  var th=$(this)
	  var offset = th.parent().offset();
		if	(th.data('rel'))	{
	  $("#bodyWrapper").append("<p id='screenshotCategory'><img src='"+ th.data('rel') +"' alt='' /></p>");         
	  $("#screenshotCategory").slideDown(500)
	  .css("top",(e2.pageY - offset.top - xOffset) + "px")
	  .css("left",(e2.pageX - offset.left + yOffset) + "px")
		}
	},
	function(){
		$("#bodyWrapper #screenshotCategory").remove();
	});
	$(".infoBoxContents ul li a").mousemove(function(e3){
		   $("#screenshotCategory")
		   .css("top",(e3.pageY - xOffset) + "px")
		   .css("left",(e3.pageX + yOffset) + "px");
		 });  
};
// starting the script on page load
$(document).ready(function(){
	screenshotPreviewCategory();
});
