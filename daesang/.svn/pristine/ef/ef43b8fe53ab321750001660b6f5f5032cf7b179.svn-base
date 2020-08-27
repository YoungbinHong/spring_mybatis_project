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
        $("#popSearch").slideToggle();
    });

    $("#popSearch .btn_close").click(function(e){
        e.preventDefault();
        $("#popSearch").slideToggle();
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

    $(".btn_menu").click(function(e){
        e.preventDefault();
        $("#nav").slideToggle();
        $(this).toggle();
        $(".nav_close").show();
    });
    $(".nav_close").click(function(e){
        e.preventDefault();
        $("#nav").slideToggle();
        $(".nav_close").hide();
        $(".btn_menu").show();
    });

    $(".btn_qna").click(function(e){
        e.preventDefault();
        $("#channel").css({
            opacity:1,
            "transform":"scale(1,1)"
        });
    });
    $("#channel").click(function(e){
        e.preventDefault();
        $("#channel").css({
            opacity:0,
            "transform":"scale(0,0)"
        });
    });
});