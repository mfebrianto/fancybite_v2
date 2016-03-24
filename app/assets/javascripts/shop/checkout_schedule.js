fancybite.shop.checkout_schedule = {
    init: function(){
        this.buttonsReadyOnClick();
    },
    buttonsReadyOnClick: function(){
        $('.div-radio-button').click(function(e){
            e.preventDefault();
            var $activeElement = $('.div-radio-button-group>div.active');
            $activeElement.removeClass('active');

            $('.input-div-radio-button').removeAttr('checked');
            console.log('clicked');

            var $element = $(e.target);
            $element.addClass('active');
            $element.children().attr('checked',true);
        });
    }
}