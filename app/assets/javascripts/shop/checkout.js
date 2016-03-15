fancybite.shop.checkout = {
    init: function(){
        fancybite.shop.shopping_cart.init();
        this.submission();
    },
    submission: function(){
        $('#checkout-submit-button').click(function(){
            console.log('submit-button clicked');


            $.ajax({
                type: 'POST',
                url: '/checkout',
                data: $('#customer_detail_form').serialize(),
                success: function(){
                    console.log('success');
                }
            });
        })
    }
}