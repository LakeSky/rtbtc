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

});

(function () { try { var s, a, i, j, r, c, l, b = document.getElementsByTagName("script"); l = b[b.length - 1].previousSibling; a = l.getAttribute('data-cfemail'); if (a) { s = ''; r = parseInt(a.substr(0, 2), 16); for (j = 2; a.length - j; j += 2) { c = parseInt(a.substr(j, 2), 16) ^ r; s += String.fromCharCode(c); } s = document.createTextNode(s); l.parentNode.replaceChild(s, l); } } catch (e) { } })();
(function () { try { var s, a, i, j, r, c, l = document.getElementsByTagName("a"), t = document.createElement("textarea"); for (i = 0; l.length - i; i++) { try { a = l[i].getAttribute("href"); if (a && "www.cloudflare.com/email-protection" == a.substr(7, 35)) { s = ''; j = 43; r = parseInt(a.substr(j, 2), 16); for (j += 2; a.length - j && a.substr(j, 1) != 'X'; j += 2) { c = parseInt(a.substr(j, 2), 16) ^ r; s += String.fromCharCode(c); } j += 1; s += a.substr(j, a.length - j); t.innerHTML = s.replace(/</g, "&lt;").replace(/>/g, "&gt;"); l[i].setAttribute("href", "mailto:" + t.value); } } catch (e) { } } } catch (e) { } })();
