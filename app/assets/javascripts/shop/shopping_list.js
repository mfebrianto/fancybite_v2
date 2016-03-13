fancybite.shop.shopping_list = {
    show: function(){
        $('.shopping-list').animate({
            marginRight:  '0px'
        }, 1000);
    },
    hide: function(){
        $('.shopping-list').animate({
            marginRight:  '-220px'
        }, 1000);
    },
    updateShoppingListDetail: function(data){
        $('#shopping-list-content').html(
            this.dataToHtmlTable(data)
        );

        this.readyRemoveItem();


        $('.shopping-list-total').html(
            this.totalToHtmlTable(data)
        )
    },
    totalToHtmlTable: function(data){
        return 'Total $'+this.totalItems(data.items);
    },
    dataToHtmlTable: function(data){
        return this.tableTemplate(data.items);
    },
    totalItems: function(items){
        var totalItems = 0;
        $.each(items, function(index, item){
            var subtotal = item.number_of_item * item.price;
            totalItems += subtotal;
        });
        return totalItems;
    },
    tableTemplate: function(items){
        var htmlContent='';
        $.each(items, function(index, item){
            var subtotal = item.number_of_item * item.price;
            htmlContent += fancybite.shop.shopping_list.tableRowTemplate(item.id, item.name, item.number_of_item, subtotal);
        });
        return htmlContent;
    },
    tableRowTemplate: function(id, name, qty, subtotal){
        return '<tr class="tranparent-row">' +
            '<td>'+name+'</td>' +
            '<td>'+qty+'</td>' +
            '<td>'+subtotal+'</td>' +
            '<td><div data-id='+id+' class="shopping-list-remove-item"></div></td>' +
        '</tr>'
    },
    readyRemoveItem: function(){
        $('.shopping-list-remove-item').click(function(e){
            fancybite.shop.shopping_list.removeItem(e);
        });
    },
    removeItem: function(e){
        e.preventDefault();
        var id = $(e.target).data('id');

        $.ajax({
            type: 'DELETE',
            url: '/basket_items/'+id,
            success: function(data){
                fancybite.shop.shopping_cart.updateShoppingCartItemNumber(data.total_items);
                fancybite.shop.shopping_list.updateShoppingListDetail(data);
            }
        });
    }

}

