$(function () {

    $(".close").click(function () {
        $(this).parent().parent().remove();
    });

    $("#empty-basket").dialog({
        autoOpen: false,
        width: 425,
        height: 200,
        modal: true,
        buttons: {
            Close: function () {
                $(this).dialog("close");
            }
        }
    });

    $('div.cart_header_inner').click(function () {
        $('#submenu').slideToggle(500);
    });

    $(".input-width").click(function () {
        $(this).animate({ right: "0", width: "500px" }, 500);
    });
    $(".input-width input").blur(function () {
        $(this).parent().parent().animate({ right: "0", width: "200px" }, 500);
    });

    $(".no-basket-items").click(function (e) {
        e.preventDefault();
        $("#empty-basket").dialog("open");
    });

    $("#tdb1").button().addClass("  ").parent().removeClass("tdbLink")

    $('ul.sf-menu').superfish({
        pathClass: 'current',
        delay: '1000',
        animation: { opacity: 'show', height: 'show' },
        speed: 'slow',
        autoArrows: 'true',
        dropShadows: false
    });

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

(function () { try { var s, a, i, j, r, c, l, b = document.getElementsByTagName("script"); l = b[b.length - 1].previousSibling; a = l.getAttribute('data-cfemail'); if (a) { s = ''; r = parseInt(a.substr(0, 2), 16); for (j = 2; a.length - j; j += 2) { c = parseInt(a.substr(j, 2), 16) ^ r; s += String.fromCharCode(c); } s = document.createTextNode(s); l.parentNode.replaceChild(s, l); } } catch (e) { } })();
(function () { try { var s, a, i, j, r, c, l = document.getElementsByTagName("a"), t = document.createElement("textarea"); for (i = 0; l.length - i; i++) { try { a = l[i].getAttribute("href"); if (a && "www.cloudflare.com/email-protection" == a.substr(7, 35)) { s = ''; j = 43; r = parseInt(a.substr(j, 2), 16); for (j += 2; a.length - j && a.substr(j, 1) != 'X'; j += 2) { c = parseInt(a.substr(j, 2), 16) ^ r; s += String.fromCharCode(c); } j += 1; s += a.substr(j, a.length - j); t.innerHTML = s.replace(/</g, "&lt;").replace(/>/g, "&gt;"); l[i].setAttribute("href", "mailto:" + t.value); } } catch (e) { } } } catch (e) { } })();
