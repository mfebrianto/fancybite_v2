shop.menu_index = {
    init: function() {
        this.addToCart();
    },
    addToCart: function() {
        $('.add-to-cart').click(function(e){
            e.preventDefault();
            shop.shopping_cart.addItem();
        })
    }
}