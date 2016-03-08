fancybite.common.notification = {
    show: function(message){
        var $notification = $('.notification')
        $notification.text(message);
        $notification.slideDown(2000);
        setInterval(3000, this.hide());
    },
    hide: function(){
        $('.notification').slideUp(2000);
    }
}