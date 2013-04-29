$(function () {

    $('#camera_wrap_1').camera({
        fx: 'random', // random, simpleFade, curtainTopLeft, curtainTopRight, curtainBottomLeft, curtainBottomRight, curtainSliceLeft, curtainSliceRight, blindCurtainTopLeft, blindCurtainTopRight, blindCurtainBottomLeft, blindCurtainBottomRight, blindCurtainSliceBottom, blindCurtainSliceTop, stampede, mosaic, mosaicReverse, mosaicRandom, mosaicSpiral, mosaicSpiralReverse, topLeftBottomRight, bottomRightTopLeft, bottomLeftTopRight, bottomLeftTopRight
        //you can also use more than one effect, just separate them with commas: simpleFade, scrollRight, scrollBottom

        height: '430px',
        minHeight: 200,
        thumbnails: true,
        loader: 'bar', //pie, bar, none (even if you choose "pie", old browsers like IE8- can't display it... they will display always a loading bar)
        pieDiameter: 38,
        piePosition: 'rightTop', //'rightTop', 'leftTop', 'leftBottom', 'rightBottom'				
        loaderColor: '#96ca2d',
        loaderBgColor: '#000000',
        time: 5000,
        transPeriod: 1000
    });

    var li = (document.getElementById('tabnav').getElementsByTagName('li').length);
    $('#tabnav li').css('width', 100 / li - 0 + '%')

    var row_list_new_products_name = $('.row_new_products_name');
    row_list_new_products_name.each(function () {
        new equalHeights_new_products_name($('#' + $(this).attr("id")));
    });
    var row_list_new_products_block = $('.row_new_products_block');
    row_list_new_products_block.each(function () {
        new equalHeights_new_products_block($('#' + $(this).attr("id")));
    });
    var row_list_new_products_desc = $('.row_new_products_desc');
    row_list_new_products_desc.each(function () {
        new equalHeights_new_products_desc($('#' + $(this).attr("id")));
    });

    var row_list_featured_name = $('.row_featured_name');
    row_list_featured_name.each(function () {
        new equalHeights_featured_name($('#' + $(this).attr("id")));
    });
    var row_list_featured_block = $('.row_featured_block');
    row_list_featured_block.each(function () {
        new equalHeights_featured_block($('#' + $(this).attr("id")));
    });
    var row_list_featured_desc = $('.row_featured_desc');
    row_list_featured_desc.each(function () {
        new equalHeights_featured_desc($('#' + $(this).attr("id")));
    });

    var row_list_products_name_11 = $('.row_products_name_11');
    row_list_products_name_11.each(function () {
        new equalHeights_products_name_11($('#' + $(this).attr("id")));
    });

    var row_list_products_name_12 = $('.row_products_name_12');
    row_list_products_name_12.each(function () {
        new equalHeights_products_name_12($('#' + $(this).attr("id")));
    });

    var row_list_products_name_13 = $('.row_products_name_13');
    row_list_products_name_13.each(function () {
        new equalHeights_products_name_13($('#' + $(this).attr("id")));
    });

    $("#foo1").carouFredSel({
        circular: true,
        mousewheel: true,
        infinite: false,
        width: "100%",
        auto: 5000,
        prev: {
            button: "#foo1_prev",
            key: "left"
        },
        next: {
            button: "#foo1_next",
            key: "right"
        }
    });

    $('.productListTable tr:nth-child(even)').addClass('alt');

});