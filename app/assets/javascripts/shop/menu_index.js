fancybite.shop.menu_index = {
    init: function() {
        this.addToCart();
        fancybite.shop.shopping_cart.init();
    },
    addToCart: function() {
        $('.add-to-cart').click(function(e){
            e.preventDefault();
            var menu_id = $(this).data("id")
            fancybite.shop.shopping_cart.addItem(menu_id);

        })
    }
}