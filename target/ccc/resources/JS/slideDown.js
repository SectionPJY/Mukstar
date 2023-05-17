//header slideDown  js 파일
$(document).ready(function(){
    $('nav ul li').mouseenter(function(){
        $(this).children('ul').stop().slideDown();
    })
    $('nav ul li').mouseleave(function(){
        $(this).children('ul').stop().slideUp();
    })
})