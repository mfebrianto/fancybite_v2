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
        )
    },
    dataToHtmlTable: function(data){
        return this.tableTemplate(data.items);
    },
    tableTemplate: function(items){
        console.log('>>>>>>>>');
        console.log(items);
        var htmlContent='';
        $.each(items, function(){
            //TODO: need to pass in price per item in JSON file
        });
        return htmlContent;
    },
    tableRowTemplate: function(menu, qty, subtotal){
        return '<tr>' +
            '<td>menu</td>' +
            '<td>qty</td>' +
            '<td>subtotal</td>' +
        '</tr>'
    }

}

