var slider;
function sliderOptions(width){

    var options;
    if(width>765) {
        options = {
            minSlides: 3,
            maxSlides: 3,
            slideWidth: 700,
            slideMargin: 21,
            responsive: false
        }
    }
    else if(width>555&&width<=765) {
        options = {
            minSlides: 3,
            maxSlides: 3,
            slideWidth: 700,
            slideMargin: 21,
            responsive: false
        }
    }
    else {
        options = {
            minSlides: 1,
            maxSlides: 1,
            slideWidth:0,
            moveSlides:1,
            slideMargin: 5,
            responsive: false
        }
    }

    return options;
}

$(document).ready(function(){
    slider = $('.awesome-products').bxSlider(sliderOptions($( window ).width()));
});

$(window).on('resize', function(){
    slider.destroySlider();
    slider = $('.awesome-products').bxSlider(sliderOptions($( window ).width()));
});
