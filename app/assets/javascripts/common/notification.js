fancybite.common.notification = {
    show_notification: function(message){
        var $notification = $('.notification')
        $notification.text(message);
        $notification.slideDown(2000);
    },
    show: function(message){
        this.show_notification(message);
        setInterval(3000, this.hide());
    },
    show_forever: function(message){
        this.show_notification(message);
    },
    hide: function(){
        $('.notification').slideUp(2000);
    }
}