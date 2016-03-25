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
    IsCustomerDataFormValid: function(){
        var status = true;

        $('#customer_detail_form :input').each(function(){
            Foundation.libs.abide.validate($(this),{type: ''});
        });

        $('.error').each(function(){
            status = $(this).is(":visible");
            return !status;
        });

        return !status;
    },
    submission: function(){
        $('#checkout-submit-button').click(function(e){
            e.preventDefault();

            if (fancybite.shop.checkout.IsCustomerDataFormValid()){
                $.ajax({
                    type: 'POST',
                    url: '/customers',
                    data: $('#customer_detail_form').serialize(),
                    success: function(){
                        console.log('success');
                        fancybite.shop.checkout.submitPayment();
                    }
                });
            }
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