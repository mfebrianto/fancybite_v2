fancybite.shop.checkout_schedule = {
    init: function(){
        this.buttonsReadyOnClick(),
        this.changeDeliveryDate()
    },
    changeDeliveryDate: function(){
        $('#date').change(function(){
            var schedule = fancybite.shop.checkout_schedule.getAvailableDeliveryTime(this.value);
            fancybite.shop.checkout_schedule.disableCheckoutScheduleOptions(schedule);
            // TODO: need to move the active class too
        });
    },
    getAvailableDeliveryTime: function(id){
        var result;
        $.ajax({
            type: 'GET',
            url: '/delivery_time_schedule/'+id,
            async: false,
            statusCode: {
                200: function(data){
                    result = {morning: data.morning,
                              afternoon: data.afternoon,
                              evening: data.evening};
                },
                404: function(){
                    console.log('delivery_time_schedule not found');
                    return 0;
                }
            }
        });
        return result;
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
    disableCheckoutScheduleOptions: function(schedule){
        var $activeElement = $('.div-radio-button-group>div.disabled');
        $activeElement.removeClass('disabled');

        if(schedule.morning){
            $('#morning-delivery').addClass('disabled');
        }
        else if(schedule.afternoon){
            $('#afternoon-delivery').addClass('disabled');
        }
        else if(schedule.evening){
            $('#evening-delivery').addClass('disabled');
        }
    }
}