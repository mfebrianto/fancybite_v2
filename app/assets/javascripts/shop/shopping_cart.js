shop.shopping_cart = {
    addItem: function(menuId){
        console.log('item added'+menuId);
        $.ajax({
            type: "POST",
            url: '/baskets',
            beforeSend: shop.common.loadLoadingOverlay(),
            data: {id: menuId},
            success: this.itemAddedSuccess()
        });
    },
    itemAddedSuccess: function(){
        shop.common.closeLoadingOverlay()
        this.refreshItemNumber();
    },
    refreshItemNumber: function(){

    }
}

