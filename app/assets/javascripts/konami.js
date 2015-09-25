var xyzzy = 0;

$(document).keydown(function(key) {
    // 38 39 40 37
    switch(xyzzy) {
        case 0:
        case 1:
            if(key.keyCode == 38) xyzzy++;
            else xyzzy = 0;
            break;
        case 2:
        case 3:
            if(key.keyCode == 40) xyzzy++;
            else xyzzy = 0;
            break;
        case 4:
            if(key.keyCode == 37) xyzzy++;
            else xyzzy = 0;
            break;
        case 5:
            if(key.keyCode == 39) xyzzy++;
            else xyzzy = 0;
            break;
        case 6:
            if(key.keyCode == 37) xyzzy++;
            else xyzzy = 0;
            break;
        case 7:
            if(key.keyCode == 39) xyzzy++;
            else xyzzy = 0;
            break;
        case 8:
            if(key.keyCode == 66) xyzzy++;
            else xyzzy = 0;
            break;
        case 9:
            if(key.keyCode == 65) xyzzy++;
            else xyzzy = 0;
            break;
        case 10:
            if(key.keyCode == 13) xyzzy++;
            else xyzzy = 0;
            break;

    }

    if(xyzzy == 11) {
        xyzzy = 0;
        $(".title-red").css({'background-color':'#000'});
        $(".title-black").css({'background-color':'#FE0', 'margin-right': '0'});
        $("#content").css({'background-color':'#FE0'});
        $(".title-black-text").css({'color':'#000', 'padding-left':'5px', 'right': '185px'}).text('Watch');
        $(".title-red-text").css({'color':'#FE0', 'background':'#000', 'left': '289px'}).text('Men');
        $(".red").css({'color':'#FE0'});
        $("body").css({'color':'#000', 'background-image': 'url(\'/assets/Watchmen.jpg\')'});
        $("button").css({'color':'#000'});
        $("#snowman").html("&#x2601;");
        $("nav.home ul li").css({'background-color':'#FE0'});
        $("nav.home ul li a").css({'color': '#000'});
        $(".black").html("artmen").css("text-align", "center");
        $(".red").html("");
        $(".white").html("<i>who art the artmen?</i><br />charles <i>price &ndash;</i> john <i>rachwal</i>");
    }
});

