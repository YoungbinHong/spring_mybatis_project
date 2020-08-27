$(document).ready(function(){

    $(".btn_top").click(function(e){
        e.preventDefault();
        $('html, body').stop().animate({scrollTop: 0}, 500);
    });

    $(".btn_down").click(function(e){
        e.preventDefault();
        $('html, body').stop().animate({scrollTop: $(document).height()}, 500);
    });

    $(".btn_search").click(function(e){
        e.preventDefault();
        $("#popSearch").fadeIn();
        $("#popSearch").css({
            top:$(window).scrollTop()
        });
    });

    $("#popSearch .btn_close").click(function(e){
        e.preventDefault();
        $("#popSearch").fadeOut();
    });

    $("#chatBot").click(function(){
        $(this).css({
            "transform":"scale(0,0)"
        });
        $("#channel").css({
            "opacity":1,
            "transform":"scale(1,1)"
        });
    });

    $("#channel").click(function(){
        $("#channel").css({
            "opacity":0,
            "transform":"scale(0,0)"
        });
        $("#chatBot").css({
            "transform":"scale(1,1)"
        });
    });
});