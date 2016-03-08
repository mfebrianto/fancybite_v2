fancybite.shop.shopping_cart = {
    init: function(){
        this.clickShoppingcart();
        this.refreshItemNumber();
    },
    addItem: function(menuId){
        $.ajax({
            type: 'POST',
            url: '/baskets',
            beforeSend: fancybite.shop.common.loadLoadingOverlay(),
            data: {id: menuId},
            success: function(data){
                fancybite.shop.shopping_cart.itemAddedSuccess(data.message);
            }
        });
    },
    itemAddedSuccess: function(message){
        fancybite.shop.common.closeLoadingOverlay();
        fancybite.common.notification.show(message);
        this.refreshItemNumber();
    },
    refreshItemNumber: function(){
        $.ajax({
            type: 'GET',
            url: '/baskets',
            success: function(data){
                fancybite.shop.shopping_cart.updateShoppingCartItemNumber(data.total_items)
            }
        });
    },
    updateShoppingCartItemNumber: function(itemNumber){
        $('#shopping-cart-item-number').text(itemNumber)
    },
    clickShoppingcart: function(){
        $('.shopping-basket').click(function(){
            fancybite.shop.shopping_list.show();
        });
    }

}

