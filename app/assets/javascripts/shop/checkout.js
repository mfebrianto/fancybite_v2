fancybite.shop.checkout = {
    init: function(){
        fancybite.shop.shopping_cart.clickShoppingcart(),
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
        $('#checkout-submit-button').click(function(){
            console.log('submit-button clicked');

            $('#customer_detail_form').submit();

            //$.ajax({
            //    type: 'POST',
            //    url: '/checkout',
            //    data: $('#customer_detail_form').serialize(),
            //    success: function(){
            //        console.log('success');
            //    }
            //});
        })
    }
}