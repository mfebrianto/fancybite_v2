fancybite.shop.checkout = {
    init: function(){
        fancybite.shop.shopping_cart.clickShoppingcart(),
        fancybite.shop.checkout_schedule.init();
        this.checkShoppingCart(),
        this.submission(),
        this.checkPostcode()
    },
    checkPostcode: function(){
      $('#postcode').change(function(){
          var postcode = $('#postcode').val();
          if(postcode.length == 4){
              fancybite.shop.checkout.isPostcodeOnCoverage(postcode)
          }
      });
    },
    isPostcodeOnCoverage: function(postcode){
        $.ajax({
            type: 'GET',
            url: '/delivery_coverage/'+postcode,
            statusCode: {
                200: function(){
                    fancybite.shop.checkout.insideCoverageArea();
                },
                404: function(){
                    fancybite.shop.checkout.outsideCoverageArea();
                }
            }
        });
    },
    insideCoverageArea: function(){
        fancybite.common.notification.hide();
        $('#date').attr('disabled', false);
    },
    outsideCoverageArea: function(){
        var message = 'Sorry your address is outside our coverage area. You can submit the order without make a payment. We will contact you through email to process your order.';
        fancybite.common.notification.show_forever(message);
        $('#date').attr('disabled', true);
    },
    checkShoppingCart: function(){
      $('#shopping-cart-link').click(function(e){
          e.preventDefault();
          $('.shopping-basket').click();
      });
    },
    goToFirstError: function(){
        $('html, body').animate({
            scrollTop: ($('.error:visible').first().offset().top)
        },500);
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
            } else{
                fancybite.shop.checkout.goToFirstError();
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