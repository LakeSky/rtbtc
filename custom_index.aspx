<%@ Page Language="C#" AutoEventWireup="true" CodeFile="custom_index.aspx.cs" Inherits="custom_index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=0.83, maximum-scale=0.83, minimum-scale=0.83, user-scalable=0" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <title>osCommerce</title>
    <link rel="stylesheet" type="text/css" href="/rtbtc/styles/template/redmond/style.css" />
    <link rel="stylesheet" type="text/css" href="/rtbtc/styles/template/jquery_qtip/style.css" />
    <link rel="stylesheet" type="text/css" href="/rtbtc/styles/template/stylesheet.css" />
    <link rel="stylesheet" type="text/css" href="/rtbtc/styles/template/style.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="/rtbtc/styles/template/superfish.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="/rtbtc/styles/template/camera.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="/rtbtc/styles/template/sprinkle.css" />
    <link rel="stylesheet" type="text/css" href="/rtbtc/styles/template/jquery_fancy_box/style.css" />
    <!--[if IE]><script type="text/javascript" src="/rtbtc/styles/template/ie.js"></script><![endif]-->
    <link rel="stylesheet" type="text/css" href="/rtbtc/styles/template/1152_24_col.css" />
    <script type="text/javascript" src="/rtbtc/scripts/template/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="/rtbtc/scripts/template/jquery_ui/jquery-ui-1.8.23.min.js"></script>
    <script type="text/javascript" src="/rtbtc/Scripts/underscore.js"></script>
    <script type="text/javascript" src="/rtbtc/Scripts/underscore-template-settings.js"></script>
    <script type="text/javascript" src="/rtbtc/scripts/template/jquery_qtip/qtip.js"></script>
    <script type="text/javascript" src="/rtbtc/scripts/template/jquery_box_gallery/jquery.bxGallery.1.1.min.js"></script>
    <script type="text/javascript" src="/rtbtc/scripts/template/jquery_fancy_box/jquery.fancybox-1.3.4.pack.js"></script>
    <script type="text/javascript" src="/rtbtc/scripts/template/xeasyTooltipIMG.js"></script>
    <script type="text/javascript" src="/rtbtc/scripts/template/hoverIntent.js"></script>
    <script type="text/javascript" src="/rtbtc/scripts/template/superfish.js"></script>
    <script type='text/javascript' src='/rtbtc/scripts/template/jquery.mobile.customized.min.js'></script>
    <script type='text/javascript' src='/rtbtc/scripts/template/jquery.easing.1.3.js'></script>
    <script type='text/javascript' src='/rtbtc/scripts/template/jquery.camera.js'></script>
    <script type="text/javascript" src="/rtbtc/scripts/template/jquery.cookie.js"></script>
    <script type="text/javascript" src="/rtbtc/scripts/template/jquery.equalheights.js"></script>
    <script type="text/javascript" src="/rtbtc/scripts/template/jquery.stringball.js"></script>
    <script type="text/javascript" src="/rtbtc/scripts/template/jquery.mousewheel.min.js"></script>
    <script type="text/javascript" src="/rtbtc/scripts/template/jquery-ui-personalized-1.5.2.packed.js"></script>
    <script type="text/javascript" src="/rtbtc/scripts/template/sprinkle.js"></script>
    <script type="text/javascript" src="/rtbtc/scripts/template/jquery.carouFredSel-6.2.0-packed.js"
        charset="utf-8"></script>
    <script type="text/javascript" src="/rtbtc/scripts/template/js.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet'
        type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700&amp;subset=latin,cyrillic,cyrillic-ext'
        rel='stylesheet' type='text/css' />
    <style type="text/css">
        #screenshot
        {
            width: 170px;
        }
        #screenshot img
        {
            width: 170px;
            height: 137px;
        }
        #screenshotCategory img
        {
            width: 100px !important;
            height: 100px !important;
        }
        div[id*="foo"] a
        {
            width: 152px;
            height: px;
        }
        .col_10
        {
            width: 220px;
        }
        #mainWrapper
        {
            width: 1180px;
        }
    </style>
    <!--[if lte IE 7]>
<div id="ie_message"><a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode"><img alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." src="images/banner_ie.png"></a></div>
<![endif]-->
</head>
<body>
    <form id="form1" runat="server">
    <p id="back-top">
        <a href="#top"><span>Top</span></a></p>
    <div id="bodyWrapper" class="page_index en">
        <div id="mainWrapper">
            <div id="wrapper">
                <div class="container">
                    <div class="row row_1 container_24">
                        <div class="grid_24">
                            <div id="header">
                                <div class="boxes_header">
                                    <script type="text/javascript">
                                        $(document).ready(function () {
                                            $('div.cart_header_inner').click(function () {
                                                $('#submenu').slideToggle(500);
                                            });
                                        });
                                    </script>
                                    <div id="box_header_cart">
                                        <div class="cart_header_wrapper">
                                            <div class="cart_header_inner">
                                                <div class="title">
                                                    <label>
                                                        My Cart</label><strong>0</strong> products<ul id="submenu" class="submenu">
                                                            <li>Your shopping cart is empty!</li>
                                                        </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="search">
                                        <form name="quick_find" action="http://www.responsive-shop.com/osc/tstore/3/advanced_search_result.php"
                                        method="get">
                                        <div class="input-width">
                                            <div class="width-setter">
                                                <input type="text" name="keywords" value="Enter keywords here" size="10" maxlength="300"
                                                    class="go fl_left" onblur="if(this.value=='') this.value='Enter keywords here'"
                                                    onfocus="if(this.value =='Enter keywords here' ) this.value=''" /><input type="hidden"
                                                        name="osCsid" value="qKSS-ugxZQ37A3jke2owD0" />
                                            </div>
                                        </div>
                                        <div class="header_search_button">
                                            <button id="tdb1" type="submit">
                                                Search</button><script type="text/javascript">                                                                   $("#tdb1").button().addClass("  ").parent().removeClass("tdbLink");</script></div>
                                        </form>
                                    </div>
                                    <script type="text/javascript">
                                        $(function () {
                                            $(".input-width").click(function () {
                                                $(this).animate({ right: "0", width: "500px" }, 500);
                                            });
                                            $(".input-width input").blur(function () {
                                                $(this).parent().parent().animate({ right: "0", width: "200px" }, 500);
                                            });

                                        });
                                    </script>
                                    <div class="box_header_phone">
                                        <span>Call us:</span> <b>(123)-456-78901</b>
                                    </div>
                                </div>
                                <div class="boxes_above_header">
                                    <div class="menu">
                                        <div>
                                            <a class=" act" href="http://www.responsive-shop.com/osc/tstore/3/index.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                Home </a><a class="" href="http://www.responsive-shop.com/osc/tstore/3/products_new.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                    New </a><a class="" href="http://www.responsive-shop.com/osc/tstore/3/featured_products.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                        Featured </a><a class="" href="http://www.responsive-shop.com/osc/tstore/3/topsellers_products.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                            Top sellers </a><a class="" href="http://www.responsive-shop.com/osc/tstore/3/specials.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                                Specials </a><a class="" href="http://www.responsive-shop.com/osc/tstore/3/manufacturers.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                                    Brands </a><a class="" href="http://www.responsive-shop.com/osc/tstore/3/reviews.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                                        Reviews </a><a class="" href="http://www.responsive-shop.com/osc/tstore/3/contact_us.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                                            Contacts </a>
                                        </div>
                                    </div>
                                    <div class="box_header_user_menu">
                                        <div class="user_menu">
                                            <a class=" out user_menu_account" href="http://www.responsive-shop.com/osc/tstore/3/create_account.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                <i></i><span>Create an Account</span></a><a class=" out user_menu_login" href="http://www.responsive-shop.com/osc/tstore/3/login.php?osCsid=qKSS-ugxZQ37A3jke2owD0"><i></i><span>Log
                                                    in</span></a></div>
                                    </div>
                                    <div id="box_currencies" class="box_currencies">
                                        <div class="drop_down">
                                            <form name="currencies" action="http://www.responsive-shop.com/osc/tstore/3/index.php"
                                            method="get">
                                            <label>
                                                $&nbsp;U.S. Dollar<i></i></label>
                                            <input type="hidden" name="osCsid" value="qKSS-ugxZQ37A3jke2owD0" />
                                            <ul>
                                                <li class="activ"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php?currency=USD&amp;osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                    $&nbsp;U.S. Dollar</a></li>
                                                <li class=""><a href="http://www.responsive-shop.com/osc/tstore/3/index.php?currency=EUR&amp;osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                    Euro&nbsp;&euro;</a></li></ul>
                                            </form>
                                        </div>
                                    </div>
                                    <div id="box_languages" class="box_languages">
                                        <div class="drop_down">
                                            <label>
                                                <img src="../images/template/includes/en_icon.gif" alt="English" title="English"
                                                    width="18" height="12" />English<i></i></label>
                                            <ul>
                                                <li class="activ"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php?language=en&amp;osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                    <img src="../images/template/includes/en_icon.gif" alt="English" title="English"
                                                        width="18" height="12" />English</a></li>
                                                <li class=""><a href="http://www.responsive-shop.com/osc/tstore/3/index.php?language=de&amp;osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                    <img src="../images/template/includes/ge_icon.gif" alt="German" title="German"
                                                        width="18" height="12" />German</a></li>
                                                <li class=""><a href="http://www.responsive-shop.com/osc/tstore/3/index.php?language=es&amp;osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                    <img src="../images/template/includes/sp_icon.gif" alt="Spain" title="Spain"
                                                        width="18" height="12" />Spain</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <a id="storeLogo" href="http://www.responsive-shop.com/osc/tstore/3/index.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                    <img src="../images/template/logo.png" alt="osCommerce" title="osCommerce" width="258"
                                        height="59" /></a>
                            </div>
                        </div>
                        <div class="grid_24">
                            <script type="text/javascript">
                                $(document).ready(function () {
                                    $('ul.sf-menu').superfish({
                                        pathClass: 'current',
                                        delay: '1000',
                                        animation: { opacity: 'show', height: 'show' },
                                        speed: 'slow',
                                        autoArrows: 'true',
                                        dropShadows: false
                                    });
                                });
                            </script>
                            <div class="cat_navbar">
                                <div class="wpapper">
                                    <div class="navbar_bg">
                                        <ul class="sf-menu">
                                            <li class="current_0"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/hardware-c-1?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                class="current" data-rel="../images/template/category/category_hardware.gif"
                                                data-desc="This is Category Description & Category Image. Etiam accumsan sem at nibh gravida condimen...">
                                                Hardware</a>
                                                <div class="cat_panel">
                                                    <ul>
                                                        <li class="current_1"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/hardware-donec-pellentesque-c-1_5?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                            class="current" data-rel="../images/template/category/sub_1.png" data-desc="This is Category Description & Category Image. In ut tellus ut velit consectetur vulputate...">
                                                            Donec pellentesque&nbsp;(55)</a>
                                                            <ul>
                                                                <li class="current_2"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/donec-pellentesque-maecenas-sapien-c-1_5_8?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                    data-rel="../images/template/category/sub_4.png" data-desc="This is Category Description & Category Image. Fusce eu sapien eget dolor sodales tempor e...">
                                                                    Maecenas et sapien&nbsp;(8)</a></li>
                                                                <li class="current_2"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/donec-pellentesque-donec-nisl-elit-feugiat-adipisc-c-1_5_10?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                    data-rel="../images/template/category/sub_6.png" data-desc="This is Category Description & Category Image. Sed tristique ornare ligula. Nam liber temp...">
                                                                    Donec nisl elit, feug...&nbsp;(8)</a></li>
                                                                <li class="current_2"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/donec-pellentesque-sed-tristique-ornare-ligula-nul-c-1_5_11?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                    class="current" data-rel="/rtbtc/images/template/category/sub_7.png" data-desc="This is Category Description & Category Image. Ac tristique at nibh gravida consequat. Sed...">
                                                                    Sed tristique ornare ...&nbsp;(17)</a>
                                                                    <ul>
                                                                        <li class="current_3"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/sed-tristique-ornare-ligula-nul-quisque-placerat-ultrices-c-1_5_11_33?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                            data-rel="../images/template/category/sub_1.png" data-desc="This is Category Description & Category Image. Quisque placerat ultrices tellus liber temp...">
                                                                            Quisque placerat ultr...&nbsp;(10)</a></li>
                                                                        <li class="current_3"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/sed-tristique-ornare-ligula-nul-cras-tempor-est-c-1_5_11_36?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                            data-rel="../images/template/category/sub_4.png" data-desc="This is Category Description & Category Image. Donec elit augue, adipiscing vitae sollicit...">
                                                                            Cras et tempor est&nbsp;(7)</a></li>
                                                                    </ul>
                                                                </li>
                                                                <li class="current_2"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/donec-pellentesque-cras-tempor-est-duis-eget-c-1_5_12?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                    data-rel="../images/template/category/sub_8.png" data-desc="This is Category Description & Category Image. Nulla pulvinar amet sem feugiat adipiscing ...">
                                                                    Cras et tempor est. D...&nbsp;(12)</a></li>
                                                                <li class="current_2"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/donec-pellentesque-quisque-placerat-ultrices-c-1_5_13?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                    data-rel="../images/template/category/category_dvd_movies.gif" data-desc="This is Category Description & Category Image. Quisque placerat ultrices tellus liber temp...">
                                                                    Quisque placerat ultr...&nbsp;(10)</a></li>
                                                            </ul>
                                                        </li>
                                                        <li class="current_1"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/hardware-cras-tempor-est-c-1_6?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                            class="current" data-rel="../images/template/category/sub_2.png" data-desc="This is Category Description & Category Image. Donec elit augue, adipiscing vitae sollicit...">
                                                            Cras et tempor est&nbsp;(39)</a>
                                                            <ul>
                                                                <li class="current_2"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/cras-tempor-est-sollicitudin-vitae-c-1_6_14?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                    data-rel="../images/template/category/category_gadgets.png" data-desc="This is Category Description & Category Image. Etiam accumsan sem at nibh gravida condimen...">
                                                                    Sollicitudin vitae&nbsp;(10)</a></li>
                                                                <li class="current_2"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/cras-tempor-est-proin-consequat-tellus-non-velit-c-1_6_15?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                    data-rel="../images/template/category/sub_1.png" data-desc="This is Category Description & Category Image. In ut tellus ut velit consectetur vulputate...">
                                                                    Proin consequat tellu...&nbsp;(8)</a></li>
                                                                <li class="current_2"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/cras-tempor-est-cras-tempor-est-c-1_6_16?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                    data-rel="../images/template/category/sub_2.png" data-desc="This is Category Description & Category Image. Donec elit augue, adipiscing vitae sollicit...">
                                                                    Cras et tempor est&nbsp;(9)</a></li>
                                                                <li class="current_2"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/cras-tempor-est-vestibulum-posuere-tristique-c-1_6_17?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                    data-rel="../images/template/category/sub_3.png" data-desc="This is Category Description & Category Image. Proin consequat tellus non velit viverra a ...">
                                                                    Vestibulum posuere t...&nbsp;(12)</a></li>
                                                                <li class="current_2"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/cras-tempor-est-maecenas-sapien-c-1_6_18?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                    data-rel="../images/template/category/sub_4.png" data-desc="This is Category Description & Category Image. Fusce eu sapien eget dolor sodales tempor e...">
                                                                    Maecenas et sapien</a></li>
                                                            </ul>
                                                        </li>
                                                        <li class="current_1"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/hardware-vestibulum-posuere-tristique-c-1_7?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                            class="current" data-rel="../images/template/category/sub_3.png" data-desc="This is Category Description & Category Image. Proin consequat tellus non velit viverra a ...">
                                                            Vestibulum posuere t...&nbsp;(118)</a>
                                                            <ul>
                                                                <li class="current_2"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/vestibulum-posuere-tristique-etiam-accumsan-sem-nibh-gravi-c-1_7_9?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                    class="current" data-rel="../images/template/category/sub_5.png" data-desc="This is Category Description & Category Image. Nulla pulvinar amet sem feugiat adipiscing ...">
                                                                    Etiam accumsan sem at...&nbsp;(80)</a>
                                                                    <ul>
                                                                        <li class="current_3"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/etiam-accumsan-sem-nibh-gravi-cras-tempor-est-duis-eget-c-1_7_9_22?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                            data-rel="../images/template/category/sub_8.png" data-desc="This is Category Description & Category Image. Nulla pulvinar amet sem feugiat adipiscing ...">
                                                                            Cras et tempor est. D...&nbsp;(8)</a></li>
                                                                        <li class="current_3"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/etiam-accumsan-sem-nibh-gravi-donec-nisl-elit-feugiat-adipisc-c-1_7_9_30?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                            data-rel="../images/template/category/sub_6.png" data-desc="This is Category Description & Category Image. Sed tristique ornare ligula. Nam liber temp...">
                                                                            Donec nisl elit, feug...&nbsp;(8)</a></li>
                                                                        <li class="current_3"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/etiam-accumsan-sem-nibh-gravi-sollicitudin-vitae-c-1_7_9_34?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                            class="current" data-rel="../images/template/category/sub_2.png" data-desc="This is Category Description & Category Image. Etiam accumsan sem at nibh gravida condimen...">
                                                                            Sollicitudin vitae&nbsp;(44)</a>
                                                                            <ul>
                                                                                <li class="current_4"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/sollicitudin-vitae-vestibulum-posuere-tristique-c-1_7_9_34_37?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                                    data-rel="../images/template/category/sub_5.png" data-desc="This is Category Description & Category Image. Proin consequat tellus non velit viverra a ...">
                                                                                    Vestibulum posuere t...&nbsp;(12)</a></li>
                                                                                <li class="current_4"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/sollicitudin-vitae-maecenas-sapien-c-1_7_9_34_38?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                                    class="current" data-rel="../images/template/category/sub_6.png" data-desc="This is Category Description & Category Image. Fusce eu sapien eget dolor sodales tempor e...">
                                                                                    Maecenas et sapien&nbsp;(20)</a>
                                                                                    <ul>
                                                                                        <li class="current_5"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/maecenas-sapien-donec-nisl-elit-feugiat-adipisc-c-1_7_9_34_38_40?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                                            data-rel="../images/template/category/sub_8.png" data-desc="This is Category Description & Category Image. Sed tristique ornare ligula. Nam liber temp...">
                                                                                            Donec nisl elit, feug...&nbsp;(10)</a></li>
                                                                                        <li class="current_5"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/maecenas-sapien-sed-tristique-ornare-ligula-nul-c-1_7_9_34_38_41?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                                            data-rel="../images/template/category/sub_1.png" data-desc="This is Category Description & Category Image. Ac tristique at nibh gravida consequat. Sed...">
                                                                                            Sed tristique ornare ...&nbsp;(10)</a></li>
                                                                                    </ul>
                                                                                </li>
                                                                                <li class="current_4"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/sollicitudin-vitae-etiam-accumsan-sem-nibh-gravi-c-1_7_9_34_39?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                                    data-rel="../images/template/category/sub_7.png" data-desc="This is Category Description & Category Image. Nulla pulvinar amet sem feugiat adipiscing ...">
                                                                                    Etiam accumsan sem at...&nbsp;(12)</a></li>
                                                                            </ul>
                                                                        </li>
                                                                        <li class="current_3"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/etiam-accumsan-sem-nibh-gravi-cras-tempor-est-duis-eget-c-1_7_9_32?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                            data-rel="../images/template/category/sub_8.png" data-desc="This is Category Description & Category Image. Nulla pulvinar amet sem feugiat adipiscing ...">
                                                                            Cras et tempor est. D...&nbsp;(12)</a></li>
                                                                        <li class="current_3"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/etiam-accumsan-sem-nibh-gravi-proin-consequat-tellus-non-velit-c-1_7_9_35?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                            data-rel="../images/template/category/sub_3.png" data-desc="This is Category Description & Category Image. In ut tellus ut velit consectetur vulputate...">
                                                                            Proin consequat tellu...&nbsp;(8)</a></li>
                                                                    </ul>
                                                                </li>
                                                                <li class="current_2"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/vestibulum-posuere-tristique-etiam-accumsan-sem-nibh-gravi-c-1_7_19?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                    data-rel="../images/template/category/sub_5.png" data-desc="This is Category Description & Category Image. Nulla pulvinar amet sem feugiat adipiscing ...">
                                                                    Etiam accumsan sem at...&nbsp;(12)</a></li>
                                                                <li class="current_2"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/vestibulum-posuere-tristique-donec-nisl-elit-feugiat-adipisc-c-1_7_20?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                    data-rel="../images/template/category/sub_6.png" data-desc="This is Category Description & Category Image. Sed tristique ornare ligula. Nam liber temp...">
                                                                    Donec nisl elit, feug...&nbsp;(8)</a></li>
                                                                <li class="current_2"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/vestibulum-posuere-tristique-sed-tristique-ornare-ligula-nul-c-1_7_21?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                    data-rel="../images/template/category/sub_7.png" data-desc="This is Category Description & Category Image. Ac tristique at nibh gravida consequat. Sed...">
                                                                    Sed tristique ornare ...&nbsp;(8)</a></li>
                                                                <li class="current_2"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/vestibulum-posuere-tristique-gadgets-c-1_7_24?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                    data-rel="../images/template/category/category_gadgets.png" data-desc="This is Category Description & Category Image. Etiam accumsan sem at nibh gravida condimen...">
                                                                    Gadgets&nbsp;(10)</a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </li>
                                            <li class="current_0"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/software-c-2?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                data-rel="../images/template/category/category_software.gif" data-desc="This is Category Description & Category Image. Aenean mollis convallis ante dolor sodales ...">
                                                Software</a></li>
                                            <li class="current_0"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/dvd-movies-c-3?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                class="current" data-rel="../images/template/category/category_dvd_movies.gif"
                                                data-desc="This is Category Description & Category Image. Quisque placerat ultrices tellus liber temp...">
                                                DVD Movies</a>
                                                <div class="cat_panel">
                                                    <ul>
                                                        <li class="current_1"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/dvd-movies-proin-consequat-tellus-non-c-3_23?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                            class="current" data-rel="../images/template/category/category_dvd_movies.gif"
                                                            data-desc="This is Category Description & Category Image. Quisque placerat ultrices tellus liber temp...">
                                                            Proin consequat tellu...&nbsp;(58)</a>
                                                            <ul>
                                                                <li class="current_2"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/proin-consequat-tellus-non-donec-pellentesque-c-3_23_25?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                    data-rel="../images/template/category/sub_1.png" data-desc="In ut tellus ut velit consectetur vulputate. Fusce eu sapien eget dolor sodales tempor eu ...">
                                                                    Donec pellentesque&nbsp;(10)</a></li>
                                                                <li class="current_2"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/proin-consequat-tellus-non-cras-tempor-est-c-3_23_26?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                    data-rel="../images/template/category/sub_2.png" data-desc="This is Category Description & Category Image. Donec elit augue, adipiscing vitae sollicit...">
                                                                    Cras et tempor est&nbsp;(7)</a></li>
                                                                <li class="current_2"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/proin-consequat-tellus-non-vestibulum-posuere-tristique-c-3_23_27?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                    data-rel="../images/template/category/sub_3.png" data-desc="Proin consequat tellus non velit viverra a tempor nibh tincidunt. Donec elit augue, adipis...">
                                                                    Vestibulum posuere t...&nbsp;(10)</a></li>
                                                                <li class="current_2"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/proin-consequat-tellus-non-maecenas-sapien-c-3_23_28?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                    data-rel="../images/template/category/sub_4.png" data-desc="This is Category Description & Category Image. Fusce eu sapien eget dolor sodales tempor e...">
                                                                    Maecenas et sapien&nbsp;(7)</a></li>
                                                                <li class="current_2"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/proin-consequat-tellus-non-etiam-accumsan-sem-nibh-gravi-c-3_23_29?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                    data-rel="../images/template/category/sub_5.png" data-desc="This is Category Description & Category Image. Nulla pulvinar amet sem feugiat adipiscing ...">
                                                                    Etiam accumsan sem at...&nbsp;(12)</a></li>
                                                                <li class="current_2"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/proin-consequat-tellus-non-sed-tristique-ornare-ligula-nul-c-3_23_31?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                    data-rel="../images/template/category/sub_7.png" data-desc="This is Category Description & Category Image. Ac tristique at nibh gravida consequat. Sed...">
                                                                    Sed tristique ornare ...&nbsp;(12)</a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </li>
                                            <li class="current_0"><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/gadgets-c-4?osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                data-rel="../images/template/category/category_gadgets.png" data-desc="This is Category Description & Category Image. Etiam accumsan sem at nibh gravida condimen...">
                                                Gadgets</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row row_2 container_24">
                        <div class="grid_24">
                            <script type="text/javascript">
                                $(window).load(function () {
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
                                });

                            </script>
                            <div class="camera_wrap" id="camera_wrap_1">
                                <div data-src="../images/template/slider/banner_slider_01.jpg" data-thumb="../images/template/slider/banner_slider_01.jpg"
                                    class="slider_block">
                                    <div class="camera_caption moveFromRight">
                                        <span class="slider_text_1">The New Canon PowerShot SX240 HS</span> <span class="slider_text_2">
                                            English Description - Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
                                            sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
                                            Ut wisi enim ad minim...</span> <span class="slider_text_3"><small>for only</small><i>$</i><b>139.95</b></span>
                                        <span class="slider_text_4"><a href="http://www.responsive-shop.com/osc/tstore/3/redirect.php?action=slideshow_banner&amp;goto=101&amp;osCsid=qKSS-ugxZQ37A3jke2owD0"
                                            target="_self"><strong class="button_slider"><strong class="button_bg"><strong></strong>
                                            </strong><strong class="button_text">SHOP NOW!</strong></strong></a></span>
                                    </div>
                                </div>
                                <div data-src="../images/template/slider/banner_slider_02.jpg" data-thumb="../images/template/slider/banner_slider_02.jpg"
                                    class="slider_block">
                                    <div class="camera_caption moveFromRight">
                                        <span class="slider_text_1">iMac All-in-One Poweful Desktop</span> <span class="slider_text_2">
                                            English Description - Veniam, quis nostrud exerci tation ullamcorper suscipit lobortis
                                            nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit
                                            in vulputate velit esse...</span> <span class="slider_text_3"><small>for only</small><i>$</i><b>1199.00</b></span>
                                        <span class="slider_text_4"><a href="http://www.responsive-shop.com/osc/tstore/3/redirect.php?action=slideshow_banner&amp;goto=102&amp;osCsid=qKSS-ugxZQ37A3jke2owD0"
                                            target="_self"><strong class="button_slider"><strong class="button_bg"><strong></strong>
                                            </strong><strong class="button_text">SHOP NOW!</strong></strong></a></span>
                                    </div>
                                </div>
                                <div data-src="../images/template/slider/banner_slider_03.jpg" data-thumb="../images/template/slider/banner_slider_03.jpg"
                                    class="slider_block">
                                    <div class="camera_caption moveFromRight">
                                        <span class="slider_text_1">iPod Touch The Brilliant New Design</span> <span class="slider_text_2">
                                            English Description - Accumsan et iusto odio dignissim qui blandit praesent luptatum
                                            zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum
                                            soluta nobis eleifend option...</span> <span class="slider_text_3"><small>for only</small><i>$</i><b>199.00</b></span>
                                        <span class="slider_text_4"><a href="http://www.responsive-shop.com/osc/tstore/3/redirect.php?action=slideshow_banner&amp;goto=103&amp;osCsid=qKSS-ugxZQ37A3jke2owD0"
                                            target="_self"><strong class="button_slider"><strong class="button_bg"><strong></strong>
                                            </strong><strong class="button_text">SHOP NOW!</strong></strong></a></span>
                                    </div>
                                </div>
                            </div>
                            <div class="customer_greeting">
                                <strong>Welcome <span class="greetUser">Guest!</span></strong> Would you like to
                                <a href="http://www.responsive-shop.com/osc/tstore/3/login.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                    <u>log yourself in</u></a>? Or would you prefer to <a href="http://www.responsive-shop.com/osc/tstore/3/create_account.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                        <u>create an account</u></a>?</div>
                            <div class="welcome">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                exercitation ullamco laboris nisi ut aliquip ex.
                            </div>
                        </div>
                    </div>
                    <div class="row row_4 container_24">
                        <section id="bodyContent" class="col grid_24 ">
<div id="tabvanilla" class="widget">
<script type="text/javascript">
    $(document).ready(function () {
        var li = (document.getElementById('tabnav').getElementsByTagName('li').length);
        $('#tabnav li').css('width', 100 / li - 0 + '%')
    });
					</script>
<ul class="tabnav" id="tabnav">
<li><a href="#new"><strong class="title_wrapper"><strong class="title_inner"><span class="title-icon"></span>New</strong></strong></a></li>
<li><a href="#featured"><strong class="title_wrapper"><strong class="title_inner"><span class="title-icon"></span>Featured</strong></strong></a></li>
<li><a href="#box_toogle_pos_1"><strong class="title_wrapper"><strong class="title_inner"><span class="title-icon"></span>Popular</strong></strong></a></li>
<li><a href="#box_toogle_pos_2"><strong class="title_wrapper"><strong class="title_inner"><span class="title-icon"></span>Special</strong></strong></a></li>
<li><a href="#box_toogle_pos_3"><strong class="title_wrapper"><strong class="title_inner"><span class="title-icon"></span>Reviews</strong></strong></a></li></ul><div id="new" class="tabdiv">
<div class="contentContainer module_new_product">
<div id="tabs-new_grid">
<div class="contentBlock grid_view"><div class="content "><ul class="row_new_products_name  row_new_products_block" id="view_grid-0">
<li class="responsive_block" style="width:258px">
<div class="product_block equal-height_new_products_block">
<div class="product_pic_wrapper" style="width:218px;height:218px;"><a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-001-p-1?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:218px;height:218px;"><img src="../images/template/product/item-001_1.jpg" alt="Product #001" title="Product #001" width="218" height="218" style="width:218px;height:218px;"/></a></div>
<div class="featured_label "><strong></strong></div>
<div class="sale_percent "><strong>-90%</strong></div>
<div class="product_info_wrapper">
<div class="row_01">
<h3 class="product_name_wrapper name equal-height_new_products_name"><span><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-001-p-1?osCsid=qKSS-ugxZQ37A3jke2owD0">Product #001</a></span></h3>
</div>
<div class="row_02">
<div class="cl_both block">
<div class="product_price_wrapper price "><b>Price:&nbsp;&nbsp;</b><del>$&nbsp;299.99</del> <span class="productSpecialPrice">$&nbsp;29.19</span></div></div>
<div class="product_button_wrapper"><strong class="button_content button_content1"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/products_new.php?action=buy_now&amp;products_id=1&amp;osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Add&nbsp;to&nbsp;Cart</span></a></strong></strong><strong class="button_content button_content2"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php?products_id=1?osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Details</span></a></strong></strong></div>
</div>
</div>
</div>
</li><li class="prods_vseparator equal-height_new_products_block"><img src="../images/template/spacer.gif" alt="" width="1" height="1"/>
<li class="responsive_block" style="width:258px">
<div class="product_block equal-height_new_products_block">
<div class="product_pic_wrapper" style="width:218px;height:218px;"><a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-012-convallis-magna-diam-egestas-vitae-p-12?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:218px;height:218px;"><img src="../images/template/product/item-012_1.jpg" alt="Product #012 convallis magna a diam egestas vitae" title="Product #012 convallis magna a diam egestas vitae" width="218" height="218" style="width:218px;height:218px;"/></a></div>
<div class="featured_label "><strong></strong></div>
<div class="product_info_wrapper">
<div class="row_01">
<h3 class="product_name_wrapper name equal-height_new_products_name"><span><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-012-convallis-magna-diam-egestas-vitae-p-12?osCsid=qKSS-ugxZQ37A3jke2owD0">Product #012 convallis magna a diam egestas vitae</a></span></h3>
</div>
<div class="row_02">
<div class="cl_both block">
<div class="product_price_wrapper price extra"><b>Price:&nbsp;&nbsp;</b><span class="productSpecialPrice">$&nbsp;49.99</span></div></div>
<div class="product_button_wrapper"><strong class="button_content button_content1"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/products_new.php?action=buy_now&amp;products_id=12&amp;osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Add&nbsp;to&nbsp;Cart</span></a></strong></strong><strong class="button_content button_content2"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php?products_id=12?osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Details</span></a></strong></strong></div>
</div>
</div>
</div>
</li><li class="prods_vseparator equal-height_new_products_block"><img src="../images/template/spacer.gif" alt="" width="1" height="1"/>
<li class="responsive_block" style="width:258px">
<div class="product_block equal-height_new_products_block">
<div class="product_pic_wrapper" style="width:218px;height:218px;"><a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-011-p-11?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:218px;height:218px;"><img src="../images/template/product/item-011_1.jpg" alt="Product #011" title="Product #011" width="218" height="218" style="width:218px;height:218px;"/></a></div>
<div class="featured_label "><strong></strong></div>
<div class="sale_percent "><strong>-88%</strong></div>
<div class="product_info_wrapper">
<div class="row_01">
<h3 class="product_name_wrapper name equal-height_new_products_name"><span><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-011-p-11?osCsid=qKSS-ugxZQ37A3jke2owD0">Product #011</a></span></h3>
</div>
<div class="row_02">
<div class="cl_both block">
<div class="product_price_wrapper price "><b>Price:&nbsp;&nbsp;</b><del>$&nbsp;29.99</del> <span class="productSpecialPrice">$&nbsp;3.59</span></div></div>
<div class="product_button_wrapper"><strong class="button_content button_content1"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/products_new.php?action=buy_now&amp;products_id=11&amp;osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Add&nbsp;to&nbsp;Cart</span></a></strong></strong><strong class="button_content button_content2"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php?products_id=11?osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Details</span></a></strong></strong></div>
</div>
</div>
</div>
</li><li class="prods_vseparator equal-height_new_products_block"><img src="../images/template/spacer.gif" alt="" width="1" height="1"/>
<li class="responsive_block" style="width:258px">
<div class="product_block equal-height_new_products_block">
<div class="product_pic_wrapper" style="width:218px;height:218px;"><a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-010-p-10?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:218px;height:218px;"><img src="../images/template/product/item-010_1.jpg" alt="Product #010" title="Product #010" width="218" height="218" style="width:218px;height:218px;"/></a></div>
<div class="featured_label "><strong></strong></div>
<div class="product_info_wrapper">
<div class="row_01">
<h3 class="product_name_wrapper name equal-height_new_products_name"><span><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-010-p-10?osCsid=qKSS-ugxZQ37A3jke2owD0">Product #010</a></span></h3>
</div>
<div class="row_02">
<div class="cl_both block">
<div class="product_price_wrapper price extra"><b>Price:&nbsp;&nbsp;</b><span class="productSpecialPrice">$&nbsp;29.99</span></div></div>
<div class="product_button_wrapper"><strong class="button_content button_content1"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/products_new.php?action=buy_now&amp;products_id=10&amp;osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Add&nbsp;to&nbsp;Cart</span></a></strong></strong><strong class="button_content button_content2"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php?products_id=10?osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Details</span></a></strong></strong></div>
</div>
</div>
</div>
</ul></div>
</div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
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
    });	
</script>
</div>
</div><div id="featured" class="tabdiv">
<div class="contentContainer module_featured">
<div id="tabs-featured_grid">
<div class="contentBlock grid_view"><div class="content t_view"><ul class="row_featured_name  row_featured_block" id="view2_grid-0">
<li class="responsive_block" style="width:258px">
<div class="product_block equal-height_featured_block">
<div class="product_pic_wrapper" style="width:218px;height:218px;"><a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-001-p-1?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:218px;height:218px;"><img src="../images/template/product/item-001_1.jpg" alt="Product #001" title="Product #001" width="218" height="218" style="width:218px;height:218px;"/></a></div>
<div class="featured_label "><strong></strong></div>
<div class="sale_percent "><strong>-90%</strong></div>
<div class="product_info_wrapper">
<div class="row_01">
<h3 class="product_name_wrapper name equal-height_featured_name"><span><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-001-p-1?osCsid=qKSS-ugxZQ37A3jke2owD0">Product #001</a></span></h3>
</div>
<div class="row_02">
<div class="cl_both block">
<div class="product_price_wrapper price extra"><b>Price:&nbsp;&nbsp;</b><del>$&nbsp;299.99</del> <span class="productSpecialPrice">$&nbsp;29.19</span></div></div>
<div class="product_button_wrapper"><strong class="button_content button_content1"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/products_new.php?action=buy_now&amp;products_id=1&amp;osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Add&nbsp;to&nbsp;Cart</span></a></strong></strong><strong class="button_content button_content2"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php?products_id=1?osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Details</span></a></strong></strong></div>
</div>
</div>
</div>
</li><li class="prods_vseparator equal-height_featured_block"><img src="../images/template/spacer.gif" alt="" width="1" height="1"/>
<li class="responsive_block" style="width:258px">
<div class="product_block equal-height_featured_block">
<div class="product_pic_wrapper" style="width:218px;height:218px;"><a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-012-convallis-magna-diam-egestas-vitae-p-12?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:218px;height:218px;"><img src="../images/template/product/item-012_1.jpg" alt="Product #012 convallis magna a diam egestas vitae" title="Product #012 convallis magna a diam egestas vitae" width="218" height="218" style="width:218px;height:218px;"/></a></div>
<div class="featured_label "><strong></strong></div>
<div class="product_info_wrapper">
<div class="row_01">
<h3 class="product_name_wrapper name equal-height_featured_name"><span><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-012-convallis-magna-diam-egestas-vitae-p-12?osCsid=qKSS-ugxZQ37A3jke2owD0">Product #012 convallis magna a diam egestas vitae</a></span></h3>
</div>
<div class="row_02">
<div class="cl_both block">
<div class="product_price_wrapper price extra"><b>Price:&nbsp;&nbsp;</b><span class="productSpecialPrice">$&nbsp;49.99</span></div></div>
<div class="product_button_wrapper"><strong class="button_content button_content1"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/products_new.php?action=buy_now&amp;products_id=12&amp;osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Add&nbsp;to&nbsp;Cart</span></a></strong></strong><strong class="button_content button_content2"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php?products_id=12?osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Details</span></a></strong></strong></div>
</div>
</div>
</div>
</li><li class="prods_vseparator equal-height_featured_block"><img src="../images/template/spacer.gif" alt="" width="1" height="1"/>
<li class="responsive_block" style="width:258px">
<div class="product_block equal-height_featured_block">
<div class="product_pic_wrapper" style="width:218px;height:218px;"><a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-010-p-10?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:218px;height:218px;"><img src="../images/template/product/item-010_1.jpg" alt="Product #010" title="Product #010" width="218" height="218" style="width:218px;height:218px;"/></a></div>
<div class="featured_label "><strong></strong></div>
<div class="product_info_wrapper">
<div class="row_01">
<h3 class="product_name_wrapper name equal-height_featured_name"><span><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-010-p-10?osCsid=qKSS-ugxZQ37A3jke2owD0">Product #010</a></span></h3>
</div>
<div class="row_02">
<div class="cl_both block">
<div class="product_price_wrapper price "><b>Price:&nbsp;&nbsp;</b><span class="productSpecialPrice">$&nbsp;29.99</span></div></div>
<div class="product_button_wrapper"><strong class="button_content button_content1"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/products_new.php?action=buy_now&amp;products_id=10&amp;osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Add&nbsp;to&nbsp;Cart</span></a></strong></strong><strong class="button_content button_content2"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php?products_id=10?osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Details</span></a></strong></strong></div>
</div>
</div>
</div>
</li><li class="prods_vseparator equal-height_featured_block"><img src="../images/template/spacer.gif" alt="" width="1" height="1"/>
<li class="responsive_block" style="width:258px">
<div class="product_block equal-height_featured_block">
<div class="product_pic_wrapper" style="width:218px;height:218px;"><a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-007-p-7?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:218px;height:218px;"><img src="../images/template/product/item-007_1.jpg" alt="Product #007" title="Product #007" width="218" height="218" style="width:218px;height:218px;"/></a></div>
<div class="featured_label "><strong></strong></div>
<div class="product_info_wrapper">
<div class="row_01">
<h3 class="product_name_wrapper name equal-height_featured_name"><span><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-007-p-7?osCsid=qKSS-ugxZQ37A3jke2owD0">Product #007</a></span></h3>
</div>
<div class="row_02">
<div class="cl_both block">
<div class="product_price_wrapper price "><b>Price:&nbsp;&nbsp;</b><span class="productSpecialPrice">$&nbsp;34.99</span></div></div>
<div class="product_button_wrapper"><strong class="button_content button_content1"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/products_new.php?action=buy_now&amp;products_id=7&amp;osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Add&nbsp;to&nbsp;Cart</span></a></strong></strong><strong class="button_content button_content2"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php?products_id=7?osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Details</span></a></strong></strong></div>
</div>
</div>
</div>
</ul></div></div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
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
    })
</script></div>
</div><div id="box_toogle_pos_1" class="tabdiv"><div class="ui-widget infoBoxContainer additional_box">
<div class="infoBoxContents">
<div class="content "><ul class="best_sellers row_products_name_11" id="box_11-0">
<li class="responsive_block" style="width:258px">
<div class="product_block "><div>
<h3 class="product_name_wrapper name equal-height_products_name_11"><span><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-008-tempus-elementum-magna-p-8?osCsid=qKSS-ugxZQ37A3jke2owD0">Product #008 tempus elementum magna</a></span></h3>
<div class="row_00">
<div class="product_pic_wrapper" style="width:103px;"><a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-008-tempus-elementum-magna-p-8?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:103px;"><img src="../images/template/product/item-008_1.jpg" alt="Product #008 tempus elementum magna" title="Product #008 tempus elementum magna" width="103" height="103" style="width:103px;height:103px;"/></a><div class="sale_percent "><strong>-94%</strong></div></div>
</div>
<div class="row_01">
<div class="product_price_wrapper price "><b>Price:&nbsp;&nbsp;</b><del>$&nbsp;35.99</del> <span class="productSpecialPrice">$&nbsp;2.00</span></div>
<div class="product_button_wrapper"><strong class="button_content button_content1"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/products_new.php?action=buy_now&amp;products_id=8&amp;osCsid=qKSS-ugxZQ37A3jke2owD0"><span class="ui-button-text">Add&nbsp;to&nbsp;Cart</span></a></strong></strong> <strong class="button_content button_content2"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php?products_id=8?osCsid=qKSS-ugxZQ37A3jke2owD0"><span class="ui-button-text">Details</span></a></strong></strong>
</div>
</div>
<div class="row_02">
<div class="product_desc_wrapper desc">Suspendisse bibendum consequat elit, non convallis mauris ornare et. Vestibulum mollis ante libero. Donec...</div>
</div>
</div></div>
</li><li class="prods_vseparator"><div><img src="../images/template/spacer.gif" alt="" width="1" height="1"/></div>
<li class="responsive_block" style="width:258px">
<div class="product_block "><div>
<h3 class="product_name_wrapper name equal-height_products_name_11"><span><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-009-p-9?osCsid=qKSS-ugxZQ37A3jke2owD0">Product #009</a></span></h3>
<div class="row_00">
<div class="product_pic_wrapper" style="width:103px;"><a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-009-p-9?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:103px;"><img src="../images/template/product/item-009_1.jpg" alt="Product #009" title="Product #009" width="103" height="103" style="width:103px;height:103px;"/></a></div>
</div>
<div class="row_01">
<div class="product_price_wrapper price extra"><b>Price:&nbsp;&nbsp;</b><span class="productSpecialPrice">$&nbsp;29.99</span></div>
<div class="product_button_wrapper"><strong class="button_content button_content1"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/products_new.php?action=buy_now&amp;products_id=9&amp;osCsid=qKSS-ugxZQ37A3jke2owD0"><span class="ui-button-text">Add&nbsp;to&nbsp;Cart</span></a></strong></strong> <strong class="button_content button_content2"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php?products_id=9?osCsid=qKSS-ugxZQ37A3jke2owD0"><span class="ui-button-text">Details</span></a></strong></strong>
</div>
</div>
<div class="row_02">
<div class="product_desc_wrapper desc">Ut tellus elit, ultricies at porttitor non, vulputate at dolor. Vivamus vehicula libero et sem varius dap...</div>
</div>
</div></div>
</li><li class="prods_vseparator"><div><img src="../images/template/spacer.gif" alt="" width="1" height="1"/></div>
<li class="responsive_block" style="width:258px">
<div class="product_block "><div>
<div class="featured_label "><strong></strong></div>
<h3 class="product_name_wrapper name equal-height_products_name_11"><span><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-010-p-10?osCsid=qKSS-ugxZQ37A3jke2owD0">Product #010</a></span></h3>
<div class="row_00">
<div class="product_pic_wrapper" style="width:103px;"><a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-010-p-10?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:103px;"><img src="../images/template/product/item-010_1.jpg" alt="Product #010" title="Product #010" width="103" height="103" style="width:103px;height:103px;"/></a></div>
</div>
<div class="row_01">
<div class="product_price_wrapper price "><b>Price:&nbsp;&nbsp;</b><span class="productSpecialPrice">$&nbsp;29.99</span></div>
<div class="product_button_wrapper"><strong class="button_content button_content1"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/products_new.php?action=buy_now&amp;products_id=10&amp;osCsid=qKSS-ugxZQ37A3jke2owD0"><span class="ui-button-text">Add&nbsp;to&nbsp;Cart</span></a></strong></strong> <strong class="button_content button_content2"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php?products_id=10?osCsid=qKSS-ugxZQ37A3jke2owD0"><span class="ui-button-text">Details</span></a></strong></strong>
</div>
</div>
<div class="row_02">
<div class="product_desc_wrapper desc">In hac habitasse platea dictumst. Pellentesque ornare, justo non dignissim auctor, arcu nunc congue lorem...</div>
</div>
</div></div>
</li><li class="prods_vseparator"><div><img src="../images/template/spacer.gif" alt="" width="1" height="1"/></div>
<li class="responsive_block" style="width:258px">
<div class="product_block "><div>
<div class="featured_label "><strong></strong></div>
<h3 class="product_name_wrapper name equal-height_products_name_11"><span><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-012-convallis-magna-diam-egestas-vitae-p-12?osCsid=qKSS-ugxZQ37A3jke2owD0">Product #012 convallis magna a diam egestas vitae</a></span></h3>
<div class="row_00">
<div class="product_pic_wrapper" style="width:103px;"><a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-012-convallis-magna-diam-egestas-vitae-p-12?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:103px;"><img src="../images/template/product/item-012_1.jpg" alt="Product #012 convallis magna a diam egestas vitae" title="Product #012 convallis magna a diam egestas vitae" width="103" height="103" style="width:103px;height:103px;"/></a><div class="sale_percent "><strong>-94%</strong></div></div>
</div>
<div class="row_01">
<div class="product_price_wrapper price "><b>Price:&nbsp;&nbsp;</b><del>$&nbsp;49.99</del> <span class="productSpecialPrice">$&nbsp;2.99</span></div>
<div class="product_button_wrapper"><strong class="button_content button_content1"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/products_new.php?action=buy_now&amp;products_id=12&amp;osCsid=qKSS-ugxZQ37A3jke2owD0"><span class="ui-button-text">Add&nbsp;to&nbsp;Cart</span></a></strong></strong> <strong class="button_content button_content2"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php?products_id=12?osCsid=qKSS-ugxZQ37A3jke2owD0"><span class="ui-button-text">Details</span></a></strong></strong>
</div>
</div>
<div class="row_02">
<div class="product_desc_wrapper desc">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ultrices convallis sodales. Curabitur aliq...</div>
</div>
</div></div>
</li></ul></div>
<strong class="button_content button_content3"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/topsellers_products.php?osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">See all Popular</span></a></strong></strong>
</div></div>
<script type="text/javascript">
    $(document).ready(function () {
        var row_list_products_name_11 = $('.row_products_name_11');
        row_list_products_name_11.each(function () {
            new equalHeights_products_name_11($('#' + $(this).attr("id")));
        });
    })
</script>
</div><div id="box_toogle_pos_2" class="tabdiv">
<div class="ui-widget infoBoxContainer additional_box">
<div class="infoBoxContents">
<div class="content "><ul class="specials row_products_name_12" id="box_12-0">
<li class="responsive_block" style="width:258px">
<div class="product_block "><div>
<h3 class="product_name_wrapper name equal-height_products_name_12"><span><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-003-p-3?osCsid=qKSS-ugxZQ37A3jke2owD0">Product #003</a></span></h3>
<div class="row_00">
<div class="product_pic_wrapper" style="width:103px;"><a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-003-p-3?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:103px;"><img src="../images/template/product/item-003_1.jpg" alt="Product #003" title="Product #003" width="103" height="103" style="width:103px;height:103px;"/></a><div class="sale_percent "><strong>-20%</strong></div></div>
</div>
<div class="row_01">
<div class="product_price_wrapper price "><b>Price:&nbsp;&nbsp;</b><del>$&nbsp;49.99</del> <span class="productSpecialPrice">$&nbsp;39.99</span></div>
<div class="product_button_wrapper"><strong class="button_content button_content1"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/products_new.php?action=buy_now&amp;products_id=3&amp;osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Add&nbsp;to&nbsp;Cart</span></a></strong></strong> <strong class="button_content button_content2"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php?products_id=3?osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Details</span></a></strong></strong>
</div>
</div>
<div class="row_02">
<div class="product_desc_wrapper desc">Ut tellus elit, ultricies at porttitor non, vulputate at dolor. Vivamus vehicula libero et sem variu...</div>
</div>
</div></div>
</li><li class="prods_vseparator"><div><img src="../images/template/spacer.gif" alt="" width="1" height="1"/></div>
<li class="responsive_block" style="width:258px">
<div class="product_block "><div>
<h3 class="product_name_wrapper name equal-height_products_name_12"><span><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-005-p-5?osCsid=qKSS-ugxZQ37A3jke2owD0">Product #005</a></span></h3>
<div class="row_00">
<div class="product_pic_wrapper" style="width:103px;"><a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-005-p-5?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:103px;"><img src="../images/template/product/item-005_1.jpg" alt="Product #005" title="Product #005" width="103" height="103" style="width:103px;height:103px;"/></a><div class="sale_percent "><strong>-17%</strong></div></div>
</div>
<div class="row_01">
<div class="product_price_wrapper price extra"><b>Price:&nbsp;&nbsp;</b><del>$&nbsp;35.99</del> <span class="productSpecialPrice">$&nbsp;30.00</span></div>
<div class="product_button_wrapper"><strong class="button_content button_content1"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/products_new.php?action=buy_now&amp;products_id=5&amp;osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Add&nbsp;to&nbsp;Cart</span></a></strong></strong> <strong class="button_content button_content2"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php?products_id=5?osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Details</span></a></strong></strong>
</div>
</div>
<div class="row_02">
<div class="product_desc_wrapper desc">Aliquam ut justo ipsum. Integer euismod tempor odio ut fermentum. Fusce arcu sem, ultrices id ullamc...</div>
</div>
</div></div>
</li><li class="prods_vseparator"><div><img src="../images/template/spacer.gif" alt="" width="1" height="1"/></div>
<li class="responsive_block" style="width:258px">
<div class="product_block "><div>
<h3 class="product_name_wrapper name equal-height_products_name_12"><span><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-006-p-6?osCsid=qKSS-ugxZQ37A3jke2owD0">Product #006</a></span></h3>
<div class="row_00">
<div class="product_pic_wrapper" style="width:103px;"><a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-006-p-6?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:103px;"><img src="../images/template/product/item-006_1.jpg" alt="Product #006" title="Product #006" width="103" height="103" style="width:103px;height:103px;"/></a><div class="sale_percent "><strong>-88%</strong></div></div>
</div>
<div class="row_01">
<div class="product_price_wrapper price extra"><b>Price:&nbsp;&nbsp;</b><del>$&nbsp;39.99</del> <span class="productSpecialPrice">$&nbsp;4.99</span></div>
<div class="product_button_wrapper"><strong class="button_content button_content1"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/products_new.php?action=buy_now&amp;products_id=6&amp;osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Add&nbsp;to&nbsp;Cart</span></a></strong></strong> <strong class="button_content button_content2"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php?products_id=6?osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Details</span></a></strong></strong>
</div>
</div>
<div class="row_02">
<div class="product_desc_wrapper desc">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ultrices convallis sodales. Curabitur...</div>
</div>
</div></div>
</li><li class="prods_vseparator"><div><img src="../images/template/spacer.gif" alt="" width="1" height="1"/></div>
<li class="responsive_block" style="width:258px">
<div class="product_block "><div>
<div class="featured_label "><strong></strong></div>
<h3 class="product_name_wrapper name equal-height_products_name_12"><span><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-001-p-1?osCsid=qKSS-ugxZQ37A3jke2owD0">Product #001</a></span></h3>
<div class="row_00">
<div class="product_pic_wrapper" style="width:103px;"><a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_info.php/product-001-p-1?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:103px;"><img src="../images/template/product/item-001_1.jpg" alt="Product #001" title="Product #001" width="103" height="103" style="width:103px;height:103px;"/></a><div class="sale_percent "><strong>-90%</strong></div></div>
</div>
<div class="row_01">
<div class="product_price_wrapper price extra"><b>Price:&nbsp;&nbsp;</b><del>$&nbsp;299.99</del> <span class="productSpecialPrice">$&nbsp;29.19</span></div>
<div class="product_button_wrapper"><strong class="button_content button_content1"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/products_new.php?action=buy_now&amp;products_id=1&amp;osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Add&nbsp;to&nbsp;Cart</span></a></strong></strong> <strong class="button_content button_content2"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/product_info.php?products_id=1?osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">Details</span></a></strong></strong>
</div>
</div>
<div class="row_02">
<div class="product_desc_wrapper desc">Integer bibendum placerat orci et interdum. Aliquam viverra egestas risus ut gravida. Proin et aucto...</div>
</div>
</div></div>
</li></ul></div>
<strong class="button_content button_content3"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/specials.php?osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">See all Specials</span></a></strong></strong>
</div></div>
<script type="text/javascript">
    $(document).ready(function () {
        var row_list_products_name_12 = $('.row_products_name_12');
        row_list_products_name_12.each(function () {
            new equalHeights_products_name_12($('#' + $(this).attr("id")));
        });
    })
</script>
</div><div id="box_toogle_pos_3" class="tabdiv">
<div class="ui-widget infoBoxContainer additional_box">
<div class="infoBoxContents">
<div class="content "><ul class="best_sellers row_products_name_13" id="box_13-0">
<li class="responsive_block" style="width:354px">
<div class="product_block "><div>
<div class="featured_label "><strong></strong></div>
<h3 class="product_name_wrapper name equal-height_products_name_13"><span><a href="http://www.responsive-shop.com/osc/tstore/3/product_reviews_info.php/product-001-pri-1?osCsid=qKSS-ugxZQ37A3jke2owD0">Product #001</a></span></h3>
<div class="row_00">
<div class="product_pic_wrapper" style="width:103px;"><a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_reviews_info.php/product-001-pri-1?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:103px;"><img src="../images/template/product/item-001_1.jpg" alt="Product #001" title="Product #001" width="103" height="103" style="width:103px;height:103px;"/></a><div class="sale_percent "><strong>-90%</strong></div></div>
</div>
<div class="product_desc_wrapper desc"><a href="http://www.responsive-shop.com/osc/tstore/3/product_reviews_info.php/product-001-pri-1?osCsid=qKSS-ugxZQ37A3jke2owD0">English Reviews Nullam male suada suscipit velit faucibus pulvinar. Vivamus a tortor in leo luctus hendrerit ut in risu</a>...</div>
<div class="stars"><img src="../images/template/icons/stars_3.png" alt="MODULE_BOXES_REVIEWS_BOX_TEXT_OF_5_STARS" title="MODULE_BOXES_REVIEWS_BOX_TEXT_OF_5_STARS" width="96" height="15"/></div>
</div></div>
</li><li class="prods_vseparator"><div><img src="../images/template/spacer.gif" alt="" width="1" height="1"/></div>
<li class="responsive_block" style="width:354px">
<div class="product_block "><div>
<div class="featured_label "><strong></strong></div>
<h3 class="product_name_wrapper name equal-height_products_name_13"><span><a href="http://www.responsive-shop.com/osc/tstore/3/product_reviews_info.php/product-001-pri-1?osCsid=qKSS-ugxZQ37A3jke2owD0">Product #001</a></span></h3>
<div class="row_00">
<div class="product_pic_wrapper" style="width:103px;"><a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_reviews_info.php/product-001-pri-1?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:103px;"><img src="../images/template/product/item-001_1.jpg" alt="Product #001" title="Product #001" width="103" height="103" style="width:103px;height:103px;"/></a><div class="sale_percent "><strong>-90%</strong></div></div>
</div>
<div class="product_desc_wrapper desc"><a href="http://www.responsive-shop.com/osc/tstore/3/product_reviews_info.php/product-001-pri-1?osCsid=qKSS-ugxZQ37A3jke2owD0">English Reviews Integer adipiscing arcu a nisl imperdiet vulputate. In magna justo, suscipit non rhoncus sit amet, laor</a>...</div>
<div class="stars"><img src="../images/template/icons/stars_5.png" alt="MODULE_BOXES_REVIEWS_BOX_TEXT_OF_5_STARS" title="MODULE_BOXES_REVIEWS_BOX_TEXT_OF_5_STARS" width="96" height="15"/></div>
</div></div>
</li><li class="prods_vseparator"><div><img src="../images/template/spacer.gif" alt="" width="1" height="1"/></div>
<li class="responsive_block" style="width:354px">
<div class="product_block "><div>
<div class="featured_label "><strong></strong></div>
<h3 class="product_name_wrapper name equal-height_products_name_13"><span><a href="http://www.responsive-shop.com/osc/tstore/3/product_reviews_info.php/product-001-pri-1?osCsid=qKSS-ugxZQ37A3jke2owD0">Product #001</a></span></h3>
<div class="row_00">
<div class="product_pic_wrapper" style="width:103px;"><a class="product_img" href="http://www.responsive-shop.com/osc/tstore/3/product_reviews_info.php/product-001-pri-1?osCsid=qKSS-ugxZQ37A3jke2owD0" style="width:103px;"><img src="../images/template/product/item-001_1.jpg" alt="Product #001" title="Product #001" width="103" height="103" style="width:103px;height:103px;"/></a><div class="sale_percent "><strong>-90%</strong></div></div>
</div>
<div class="product_desc_wrapper desc"><a href="http://www.responsive-shop.com/osc/tstore/3/product_reviews_info.php/product-001-pri-1?osCsid=qKSS-ugxZQ37A3jke2owD0">English Reviews Maecenas nibh magna, viverra et posuere id, pharetra vel augue. Donec sed diam dolor, et varius ante. P</a>...</div>
<div class="stars"><img src="../images/template/icons/stars_1.png" alt="MODULE_BOXES_REVIEWS_BOX_TEXT_OF_5_STARS" title="MODULE_BOXES_REVIEWS_BOX_TEXT_OF_5_STARS" width="96" height="15"/></div>
</div></div>
</li></ul></div><strong class="button_content button_content3"><strong class="button bg_button"><a href="http://www.responsive-shop.com/osc/tstore/3/reviews.php?osCsid=qKSS-ugxZQ37A3jke2owD0" role="button"><span class="ui-button-text">See all Reviews</span></a></strong></strong>
</div></div>
<script type="text/javascript">
    $(document).ready(function () {
        var row_list_products_name_13 = $('.row_products_name_13');
        row_list_products_name_13.each(function () {
            new equalHeights_products_name_13($('#' + $(this).attr("id")));
        });
    })
</script>
</div></div>
</section>
                    </div>
                    <div class="row row_7 container_24">
                        <div class="grid_24">
                            <div class="boxes_above_footer">
                                <div class="banner_set">
                                    <ul>
                                        <li class="item-1 grid_8">
                                            <div class="bannershow_block">
                                                <img src="../images/template/slider/banner_static_01.png" alt="Banner01 for banner-show"
                                                    title="Banner01 for banner-show" width="78" height="66" /><div class="bannershow_wrapper">
                                                        <div class="bannershow_caption">
                                                            <span class="slider_text_1"><b>AUTUMN SALE</b></span> <span class="slider_text_2">up
                                                                to 70% off</span> <span class="slider_text_3"></span><span class="slider_text_4"><a
                                                                    href="http://www.responsive-shop.com/osc/tstore/3/redirect.php?action=slideshow_banner&amp;goto=111&amp;osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                    target="_blank"><strong class="button_bannershow"><strong class="button_bg"></strong>
                                                                        <strong class="button_text">SHOP NOW!</strong></strong></a></span>
                                                        </div>
                                                    </div>
                                            </div>
                                        </li>
                                        <li class="item-2 grid_8">
                                            <div class="bannershow_block">
                                                <img src="../images/template/slider/banner_static_02.png" alt="Banner02 for banner-show"
                                                    title="Banner02 for banner-show" width="78" height="66" /><div class="bannershow_wrapper">
                                                        <div class="bannershow_caption">
                                                            <span class="slider_text_1">become a fan</span> <span class="slider_text_2"><b>ON FACEBOOK</b></span>
                                                            <span class="slider_text_3"></span><span class="slider_text_4"><a href="http://www.responsive-shop.com/osc/tstore/3/redirect.php?action=slideshow_banner&amp;goto=112&amp;osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                target="_blank"><strong class="button_bannershow"><strong class="button_bg"></strong>
                                                                    <strong class="button_text">CLICK HERE!</strong></strong></a></span>
                                                        </div>
                                                    </div>
                                            </div>
                                        </li>
                                        <li class="item-3 grid_8">
                                            <div class="bannershow_block">
                                                <img src="../images/template/slider/banner_static_03.png" alt="Banner03 for banner-show"
                                                    title="Banner03 for banner-show" width="78" height="54" /><div class="bannershow_wrapper">
                                                        <div class="bannershow_caption">
                                                            <span class="slider_text_1"><b>FREE SHIPPING</b></span> <span class="slider_text_2">
                                                                on orders over $399</span> <span class="slider_text_3"></span><span class="slider_text_4">
                                                                    <a href="http://www.responsive-shop.com/osc/tstore/3/redirect.php?action=slideshow_banner&amp;goto=113&amp;osCsid=qKSS-ugxZQ37A3jke2owD0"
                                                                        target="_blank"><strong class="button_bannershow"><strong class="button_bg"></strong>
                                                                            <strong class="button_text">LEARN MORE!</strong></strong></a></span>
                                                        </div>
                                                    </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <script type="text/javascript">
                                    $(document).ready(function () {
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
                                    });
                                </script>
                                <div class="brands_wrapper">
                                    <div id="foo1">
                                        <a href="http://www.responsive-shop.com/osc/tstore/3/index.php/brand-name-m-1?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                            <img src="../images/template/manufacturers/brand_example_1.png" alt="manufacturers/brand_example_1.png"
                                                title="manufacturers/brand_example_1.png" width="152" height="101" /></a><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/brand-name-m-2?osCsid=qKSS-ugxZQ37A3jke2owD0"><img
                                                    src="../images/template/manufacturers/brand_example_2.png" alt="manufacturers/brand_example_2.png"
                                                    title="manufacturers/brand_example_2.png" width="152" height="101" /></a><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/brand-name-m-3?osCsid=qKSS-ugxZQ37A3jke2owD0"><img
                                                        src="../images/template/manufacturers/brand_example_3.png" alt="manufacturers/brand_example_3.png"
                                                        title="manufacturers/brand_example_3.png" width="152" height="101" /></a><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/brand-name-m-4?osCsid=qKSS-ugxZQ37A3jke2owD0"><img
                                                            src="../images/template/manufacturers/brand_example_4.png" alt="manufacturers/brand_example_4.png"
                                                            title="manufacturers/brand_example_4.png" width="152" height="101" /></a><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/brand-name-m-5?osCsid=qKSS-ugxZQ37A3jke2owD0"><img
                                                                src="../images/template/manufacturers/brand_example_5.png" alt="manufacturers/brand_example_5.png"
                                                                title="manufacturers/brand_example_5.png" width="152" height="102" /></a><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/brand-name-m-6?osCsid=qKSS-ugxZQ37A3jke2owD0"><img
                                                                    src="../images/template/manufacturers/brand_example_6.png" alt="manufacturers/brand_example_6.png"
                                                                    title="manufacturers/brand_example_6.png" width="152" height="102" /></a><a href="http://www.responsive-shop.com/osc/tstore/3/index.php/brand-name-m-7?osCsid=qKSS-ugxZQ37A3jke2owD0"><img
                                                                        src="../images/template/manufacturers/brand_example_7.png" alt="manufacturers/brand_example_7.png"
                                                                        title="manufacturers/brand_example_7.png" width="152" height="102" /></a>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                    <a class="prev" id="foo1_prev" href="#"><span>prev</span></a> <a class="next" id="foo1_next"
                                        href="#"><span>next</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row row_5 container_24">
                        <div class="col grid_24">
                            <div class="boxes_footer">
                                <div class="Footer_BoxWrapper">
                                    <h4 class="Footer_BoxHeading">
                                        Information</h4>
                                    <ul class="footer_information">
                                        <li class="">
                                            <div class="list_bg">
                                            </div>
                                            <a href="http://www.responsive-shop.com/osc/tstore/3/our_stores.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                Our Store</a> </li>
                                        <li class="">
                                            <div class="list_bg">
                                            </div>
                                            <a href="http://www.responsive-shop.com/osc/tstore/3/contact_us.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                Contact Us</a> </li>
                                        <li class="">
                                            <div class="list_bg">
                                            </div>
                                            <a href="http://www.responsive-shop.com/osc/tstore/3/packaging.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                Packaging</a> </li>
                                        <li class="">
                                            <div class="list_bg">
                                            </div>
                                            <a href="http://www.responsive-shop.com/osc/tstore/3/shipping.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                Shipping &amp; Returns</a> </li>
                                        <li class="">
                                            <div class="list_bg">
                                            </div>
                                            <a href="http://www.responsive-shop.com/osc/tstore/3/privacy.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                Privacy Notice</a> </li>
                                        <li class="">
                                            <div class="list_bg">
                                            </div>
                                            <a href="http://www.responsive-shop.com/osc/tstore/3/conditions.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                Conditions of Use</a> </li>
                                    </ul>
                                </div>
                                <div class="Footer_BoxWrapper">
                                    <h4 class="Footer_BoxHeading">
                                        Our Offers</h4>
                                    <ul class="footer_information">
                                        <li class="">
                                            <div class="list_bg">
                                            </div>
                                            <a href="http://www.responsive-shop.com/osc/tstore/3/featured_products.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                Featured</a> </li>
                                        <li class="">
                                            <div class="list_bg">
                                            </div>
                                            <a href="http://www.responsive-shop.com/osc/tstore/3/specials.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                Specials</a> </li>
                                        <li class="">
                                            <div class="list_bg">
                                            </div>
                                            <a href="http://www.responsive-shop.com/osc/tstore/3/products_new.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                New products</a> </li>
                                        <li class="">
                                            <div class="list_bg">
                                            </div>
                                            <a href="http://www.responsive-shop.com/osc/tstore/3/topsellers_products.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                Top sellers</a> </li>
                                        <li class="">
                                            <div class="list_bg">
                                            </div>
                                            <a href="http://www.responsive-shop.com/osc/tstore/3/manufacturers.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                Manufacturers</a> </li>
                                        <li class="">
                                            <div class="list_bg">
                                            </div>
                                            <a href="http://www.responsive-shop.com/osc/tstore/3/reviews.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                Reviews</a> </li>
                                    </ul>
                                </div>
                                <div class="Footer_BoxWrapper">
                                    <h4 class="Footer_BoxHeading">
                                        Your Account</h4>
                                    <ul class="footer_information">
                                        <li class="0">
                                            <div class="list_bg">
                                            </div>
                                            <a href="http://www.responsive-shop.com/osc/tstore/3/login.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                Log in</a> </li>
                                        <li class="0">
                                            <div class="list_bg">
                                            </div>
                                            <a href="http://www.responsive-shop.com/osc/tstore/3/create_account.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                Create an Account</a> </li>
                                        <li class="0">
                                            <div class="list_bg">
                                            </div>
                                            <a href="http://www.responsive-shop.com/osc/tstore/3/shipping.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                Shipping & Returns</a> </li>
                                        <li class="">
                                            <div class="list_bg">
                                            </div>
                                            <a href="http://www.responsive-shop.com/osc/tstore/3/account_history.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                Order History</a> </li>
                                        <li class="0">
                                            <div class="list_bg">
                                            </div>
                                            <a href="http://www.responsive-shop.com/osc/tstore/3/advanced_search.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                Advanced Search</a> </li>
                                        <li class="0">
                                            <div class="list_bg">
                                            </div>
                                            <a href="http://www.responsive-shop.com/osc/tstore/3/account_newsletters.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                                Newsletter</a> </li>
                                    </ul>
                                </div>
                                <div class="Footer_BoxWrapper">
                                    <h4 class="Footer_BoxHeading">
                                        <a href="http://www.responsive-shop.com/osc/tstore/3/contact_us.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                            Contact Us</a></h4>
                                    <ul class="footer_contact">
                                        <li class="field1">
                                            <div class="list_bg">
                                            </div>
                                            The Company Name Inc. 8901 Marmora Road, Glasgow, D04 89GR. </li>
                                        <li class="field2">
                                            <div class="list_bg">
                                            </div>
                                            +1 800 603 6035 </li>
                                        <li class="field3">
                                            <div class="list_bg">
                                            </div>
                                            <a href="http://www.cloudflare.com/email-protection#fe939f9792be9d91938e9f9087909f939bd09d9193c1ad8b9c949b9d8ac3b69b929291dbccce9f999f9790">
                                                <span class="__cf_email__" data-cfemail="8be6eae2e7cbe8e4e6fbeae5f2e5eae6eea5e8e4e6">
                                                    [email&nbsp;protected]</span><script type="text/javascript">
/* <![CDATA[ */
(function(){try{var s,a,i,j,r,c,l,b=document.getElementsByTagName("script");l=b[b.length-1].previousSibling;a=l.getAttribute('data-cfemail');if(a){s='';r=parseInt(a.substr(0,2),16);for(j=2;a.length-j;j+=2){c=parseInt(a.substr(j,2),16)^r;s+=String.fromCharCode(c);}s=document.createTextNode(s);l.parentNode.replaceChild(s,l);}}catch(e){}})();
/* ]]> */
                                                    </script></a> </li>
                                        <li class="field4">
                                            <div class="list_bg">
                                            </div>
                                            technostore </li>
                                    </ul>
                                </div>
                                <div class="Footer_BoxWrapper">
                                    <h4 class="Footer_BoxHeading">
                                        Stay Connected</h4>
                                    <ul class="footer_information footer_stay_connected">
                                        <li class="item_1">
                                            <div class="list_bg">
                                            </div>
                                            <a href="https://www.facebook.com/">Facebook</a> </li>
                                        <li class="item_2">
                                            <div class="list_bg">
                                            </div>
                                            <a href="http://http://www.twitter.com/">Twitter</a> </li>
                                        <li class="item_3">
                                            <div class="list_bg">
                                            </div>
                                            <a href="http://http://www.rss.com/">RSS</a> </li>
                                        <li class="item_4">
                                            <div class="list_bg">
                                            </div>
                                            <a href="https://www.google.com">Google+</a> </li>
                                        <li class="item_5">
                                            <div class="list_bg">
                                            </div>
                                            <a href="http://http://www.pinterest.com/">Printerest</a> </li>
                                        <li class="item_6">
                                            <div class="list_bg">
                                            </div>
                                            <a href="http://http://www.youtube.com/">Youtube</a> </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="footer">
                                <p>
                                    <a href="http://www.responsive-shop.com/osc/tstore/3/index.php?osCsid=qKSS-ugxZQ37A3jke2owD0">
                                        osCommerce</a>&nbsp;&nbsp; &copy; 2013</p>
                            </div>
                            <script type="text/javascript">
                                $('.productListTable tr:nth-child(even)').addClass('alt');
                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
/* <![CDATA[ */
(function(){try{var s,a,i,j,r,c,l=document.getElementsByTagName("a"),t=document.createElement("textarea");for(i=0;l.length-i;i++){try{a=l[i].getAttribute("href");if(a&&"www.cloudflare.com/email-protection"==a.substr(7 ,35)){s='';j=43;r=parseInt(a.substr(j,2),16);for(j+=2;a.length-j&&a.substr(j,1)!='X';j+=2){c=parseInt(a.substr(j,2),16)^r;s+=String.fromCharCode(c);}j+=1;s+=a.substr(j,a.length-j);t.innerHTML=s.replace(/</g,"&lt;").replace(/>/g,"&gt;");l[i].setAttribute("href","mailto:"+t.value);}}catch(e){}}}catch(e){}})();
/* ]]> */
    </script>
    </form>
</body>
</html>
