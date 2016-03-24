fancybite.shop.checkout = {
    init: function(){
        fancybite.shop.shopping_cart.clickShoppingcart(),
        fancybite.shop.checkout_schedule.init();
        this.checkShoppingCart(),
        this.submission()
    },
    checkShoppingCart: function(){
      $('#shopping-cart-link').click(function(e){
          e.preventDefault();
          $('.shopping-basket').click();
      });
    },
    submission: function(){
        $('#checkout-submit-button').click(function(e){
            e.preventDefault();
            console.log('submit-button clicked');

            $.ajax({
                type: 'POST',
                url: '/customers',
                data: $('#customer_detail_form').serialize(),
                success: function(){
                    console.log('success');
                    fancybite.shop.checkout.submitPayment();
                }
            });
        })
    },
    submitPayment: function(){
        $.ajax({
            type: 'POST',
            url: '/payments',
            data: $('#payment_detail_form').serialize(),
            success: function(){
                console.log('success');
                fancybite.shop.checkout.submitDelivery();
            }
        });
    },
    submitDelivery: function(){
        $.ajax({
            type: 'POST',
            url: '/checkout',
            data: $('#checkout_detail_form').serialize(),
            success: function(){
                console.log('success');
            }
        });
    }
}