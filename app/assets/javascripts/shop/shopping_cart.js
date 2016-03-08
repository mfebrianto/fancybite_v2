shop.shopping_cart = {
    addItem: function(menuId){
        $.ajax({
            type: 'POST',
            url: '/baskets',
            beforeSend: shop.common.loadLoadingOverlay(),
            data: {id: menuId},
            success: function(){
                shop.shopping_cart.itemAddedSuccess();
            }
        });
    },
    itemAddedSuccess: function(){
        shop.common.closeLoadingOverlay()
        this.refreshItemNumber();
    },
    refreshItemNumber: function(){
        $.ajax({
            type: 'GET',
            url: '/baskets',
            success: function(data){
                shop.shopping_cart.updateShoppingCartItemNumber(data.total_items)
            }
        });
    },
    updateShoppingCartItemNumber: function(itemNumber){
        $('#shopping-cart-item-number').text(itemNumber)
    }
}

