/*-----------------*/
/*      links      */
/*-----------------*/
function styleLinks() {
    // external links
    jQuery('a[@href^="http://"]').addClass('external');
    // image links
    jQuery('a[@href$=".jpg"]').addClass('image');
    jQuery('a[@href$=".png"]').addClass('image');
    jQuery('a[@href$=".gif"]').addClass('image');
    // dpci,emt öomls
    jQuery('a[@href$=".txt"]').addClass('document');
    jQuery('a[@href$=".htm"]').addClass('document');
    jQuery('a[@href$=".html"]').addClass('document');
    jQuery('a[@href$=".doc"]').addClass('document');
    jQuery('a[@href$=".docx"]').addClass('document');
    jQuery('a[@href$=".pdf"]').addClass('document');
}

/*-----------------*/
/*      login      */
/*-----------------*/
function initLogin(partialUrl, standardUrl)
{
    if (document.location.href.indexOf(standardUrl) < 0) {
        jQuery('a[@href*="' + standardUrl + '"]').click(function(e) {
            e.preventDefault();
            var lc = jQuery('#ajaxlogin');
            if (lc.css('display') == 'none') {
                jQuery.ajax({
                    type: 'GET',
                    url: partialUrl,
                    success: function(data) {
                        lc.html(data).slideToggle();
                    },
                    error: function(XMLHttpRequest, textStatus, errorThrown) {
                        alert(errorThrown + "\n\n" + textStatus);
                        document.location.href = standardUrl;
                    }
                });
            }
            else {
                lc.slideToggle();
            }
        });
    }
}

jQuery(function ($) {
    $(".campoPlaca").mask("aaa-9999 aa");
});

jQuery(function ($) {
    $(".campoCPF").mask("999.999.999-99");
});

jQuery(function ($) {
    $(".campoCNPJ").mask("99.999.999/9999-99");
});

jQuery(function ($) {
    $(".campoFone").mask("(99) 9999-9999");
});

jQuery(function ($) {
    $(".campoFoneDuplo").mask("(99) 9999-9999/0000-0000");
});

jQuery(function ($) {
    $(".campoDiaMes").mask("99/99");
});

jQuery(function ($) {
    $(".campoHoraMin").mask("99:99");
});


jQuery(function ($) {
    $(".campoData").mask("99/99/9999");
});

jQuery(function ($) {
    $(".campoHora").mask("99:99");
});

jQuery(function ($) {
    $(".campoCEP").mask("99.999-999");
});

jQuery(function ($) {
    $(".campoValidade").mask("99/99");
});

jQuery(function ($) {
    $(".campoDigit").mask('a');
});

$(function () {
    $(".campoData").datepicker({
        dateFormat: 'dd/mm/yy',
        dayNames: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'],
        dayNamesMin: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab'],
        monthNames: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
        nextText: 'Próximo',
        prevText: 'Anterior',
        showOn: "button",
        buttonImage: "/Content/images/calendario.png",
        buttonImageOnly: true
    });
});