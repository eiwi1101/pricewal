var ben_kurns_index = 0;
var ben_kurns_box_t = "#relax-box-a";
var ben_kurns_box_b = "#relax-box-b";
var ben_kurns_timer = undefined;
var paused = false;

var config = {
    // Fade Between Images
    slide_fade: 3000,
    // Stretch Time
    burns_time: 8000,
    // Slide Interval,
    interval: 8000,
    // Starting Max Stretch
    start_max: [100,100,100,100],
    // Ending Max Stretch
    end_max: [200,200,100,100],
    // False to Disable Ken Burns
    pan_zoom: true
}

if (!$.support.transition)
  $.fn.transition = $.fn.animate;

function animatePage() {
    // Hide Elements
    $("nav li").each(function() {
        $(this).hide();
    });

    orig_right = $(".title-black").css("right");
    orig_left  = $(".title-red").css("left");

    // Position Offscreen
    $("body").css({overflow: "hidden"});
    $(".title-black").css({right: '100%'});
    $(".title-red").css({left: '100%'});

    $("div.loading").fadeOut(1000);

    $(".title-black").animate({
        right: orig_right,
    }, 1000, 'linear');

    $(".title-red").animate({
        left: orig_left,
    }, 1000, 'linear');

    setTimeout(function() {
        var i = 0;
        $("nav li").each(function() {
            i++;
            $(this).fadeIn(500 * i);
        });
    }, 2000);

    setTimeout(function() {
        $(".title-black").removeAttr('style');
        $(".title-red").removeAttr('style');
        $("body").css({overflow: "auto"});
    }, 2500);

}

function relax() {

    // Force Hardware Acceleration
    $('body').css({
        '-webkit-transition': 'translate3d(0,0,0)',
        'transition': 'translate3d(0,0,0)'
    });

    var i=0;
    $("nav li").reverse().each(function() {
        i++;
        $(this).fadeOut(500*i);
    });

    $("body").css({overflow: 'hidden'});
    $("header").fadeOut(1000);
    $(".title-black").fadeOut(1000);
    $(".title-red").fadeOut(1000);

    $("#relax-box-a").delay(500).fadeIn(1000);
    $("#relax-controls").delay(2500).fadeIn(1000);

    // Get Images from Server
    $.ajax({
        url: '/artworks.json', 
        dataType: 'json',
    }).done(function(data) {
        images = data;
        setTimeout(play, 2500);
    }).error(function(x,y) {
        $("#relax-img-title").html(y);
    });
}

function play() {
    paused = false;
    $("#pause").removeClass('fa-play').addClass('fa-pause');
    ben_kurns();
    ben_kurns_timer = setInterval(ben_kurns, config.interval);
}

var lrnd = false;
function rnd(l,r) {
    if(lrnd) { lrnd = false; return 0; }
    else { lrnd = Math.random() < 0.6; }
    return Math.floor((Math.random() * r) + l);
}

function ben_kurns() {
    img = images[ben_kurns_index];

    $(ben_kurns_box_b).ready(function() {
        $(ben_kurns_box_b).stop().show().css({opacity: 1});
        $(ben_kurns_box_t).transition({
            opacity: 0
        }, config.slide_fade);

        setTimeout(function() {
            $("#relax-img-title").html(img.name);
        }, config.slide_fade * 0.5);

        setTimeout(function() {
            $(ben_kurns_box_t).removeClass("top").removeAttr("style");
            $(ben_kurns_box_b).addClass("top");
        }, config.slide_fade + 10);

        if(config.pan_zoom) {
            $(ben_kurns_box_b).transition({
                'left': '-' + rnd(10,config.end_max[3]) + 'px',
                'right': '-' + rnd(10,config.end_max[1]) + 'px',
                'top': '-' + rnd(10,config.end_max[0]) + 'px',
                'bottom': '-' + rnd(10,config.end_max[2]) + 'px',
            }, config.burns_time, 'linear');
        }

        // Update Index
        ben_kurns_index++;
        if(ben_kurns_index >= images.length) ben_kurns_index = 0;

        setTimeout(function() {
            // Update Box Focus
            var tmp = ben_kurns_box_b;
            ben_kurns_box_b = ben_kurns_box_t;
            ben_kurns_box_t = tmp;
        }, config.slide_fade + 200);


    }).css({
        'left': '-' + rnd(10,config.start_max[3]) + 'px',
        'right': '-' + rnd(10,config.start_max[1]) + 'px',
        'top': '-' + rnd(10,config.start_max[0]) + 'px',
        'bottom': '-' + rnd(10,config.start_max[2]) + 'px',
        'background-image': 'url("' + img.image_file_path + '")'
    });
}

function pause() {
    if(paused) {
        play();
        $("#pause").removeClass('fa-play').addClass('fa-pause');
    } else {
        stop();
        $('#pause').removeClass('fa-pause').addClass('fa-play');
    }
}

function stop() {
    paused = true;
    clearInterval(ben_kurns_timer);
    $(ben_kurns_box_t).stop();
    $(ben_kurns_box_b).stop();
}

function stress() {
    stop();
    $(ben_kurns_box_b).show();
    $(ben_kurns_box_t).fadeOut(800);
    $("#relax-controls").fadeOut(1000);

    setTimeout(function() {
        var i=0;
        $("nav li").each(function() {
            i++;
            $(this).fadeIn(1000 + 500*i);
        });

        $("body").css({overflow: ''});
        $("header").show();
        $(".title-black").fadeIn(1000);
        $(".title-red").fadeIn(1000);

        $(ben_kurns_box_b).fadeOut(500);
        $(ben_kurns_box_t).removeAttr('style');
    }, 800);
}

jQuery.fn.reverse = [].reverse;
