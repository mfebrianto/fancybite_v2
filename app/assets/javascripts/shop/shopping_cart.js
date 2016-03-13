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
                fancybite.shop.shopping_cart.updateShoppingCartItemNumber(data.total_items);
                fancybite.shop.shopping_list.updateShoppingListDetail(data);
            }
        });
    },
    updateShoppingCartItemNumber: function(itemNumber){
        $('#shopping-cart-item-number').text(itemNumber)
    },
    animateShoppingListToLeft: function(){
        $('.shopping-basket').animate({
            marginRight:  '220px'
        }, 1000);
    },
    animateShoppingListToRight: function(){
        $('.shopping-basket').animate({
            marginRight: '0px'
        }, 1000);
    },
    clickShoppingcart: function(){
        var $shoppingBasket = $('.shopping-basket');
        $shoppingBasket.click(function(){
            if (parseInt($shoppingBasket.css('margin-right')) < 200){
                fancybite.shop.shopping_cart.animateShoppingListToLeft();
                fancybite.shop.shopping_list.show();
            }else{
                fancybite.shop.shopping_cart.animateShoppingListToRight();
                fancybite.shop.shopping_list.hide();
            }

        });
    }


}

