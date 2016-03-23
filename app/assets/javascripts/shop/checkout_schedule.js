fancybite.shop.checkout_schedule = {
    init: function(){
        this.buttonsReadyOnClick();
    },
    buttonsReadyOnClick: function(){
        $('.div-radio-button').click(function(e){
            $('.div-radio-button-group>div.active').removeClass('active');

            $(e.target).addClass('active');
        });
    }
}