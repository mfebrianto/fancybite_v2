fancybite.shop.checkout_schedule = {
    init: function(){
        this.buttonsReadyOnClick();
    },
    buttonsReadyOnClick: function(){
        $('.div-radio-button').click(function(e){
            e.preventDefault();
            if (!$(e.target).is('.disabled')){
                fancybite.shop.checkout_schedule.buttonAction(e);
            }
        });
    },
    buttonAction: function(e){
        var $activeElement = $('.div-radio-button-group>div.active');
        $activeElement.removeClass('active');

        $('.input-div-radio-button').removeAttr('checked');

        var $element = $(e.target);
        $element.addClass('active');
        $element.children().attr('checked',true);
    },
    disableCheckoutScheduleOptions: function(){
        var $activeElement = $('.div-radio-button-group>div.disabled');
        $activeElement.removeClass('disabled');

        $('#evening-delivery').addClass('disabled');
    }
}