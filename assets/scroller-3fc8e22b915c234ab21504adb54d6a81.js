(function(){$(function(){var sideResize;labels.forEach(function(label){$("#"+label+"-click").click(function(){$("html, body").animate({scrollTop:$("#"+label).offset().top},1000);return $("[data-spy='scroll']").each(function(){var $spy;return $spy=$(this).scrollspy("refresh")})});return $(".to-"+label).click(function(){var offset;offset=$("#"+label).offset().top-$(".navbar").height()-2;if(window.innerWidth<767){offset=$("#"+label).offset().top-$(".navbar").height()-62}$("html, body").animate({scrollTop:offset},1000);return $("[data-spy='scroll']").each(function(){var $spy;return $spy=$(this).scrollspy("refresh")})})});sideResize=function(){return $(".sidebar").width($(".sidebar").parent().width())};sideResize();return $(window).resize(function(){return sideResize()})})}).call(this);