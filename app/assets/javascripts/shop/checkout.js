fancybite.shop.checkout = {
    init: function(){
        fancybite.shop.shopping_cart.init(),
        fancybite.shop.shopping_list.hideCheckoutButton(),
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