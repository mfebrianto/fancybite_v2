shop.menu_index = {
    init: function() {
        this.addToCart();
    },
    addToCart: function() {
        $('.add-to-cart').click(function(e){
            e.preventDefault();
            var menu_id = $(this).data("id")
            shop.shopping_cart.addItem(menu_id);

        })
    }
}