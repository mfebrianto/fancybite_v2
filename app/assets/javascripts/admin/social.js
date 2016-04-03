fancybite.admin.social = {
    init: function() {
        fancybite.admin.social.listeners();
    },
    listeners: function() {
        $('#upload_social_photo').click(function(e){
            e.preventDefault();
            $.ajax({
                type: 'POST',
                url: '/admin/social_images',
                data: $('#social_image_form').serialize(),
                success: function(){
                    console.log('photo uploaded successfully');
                }
            });
        });
    }
}

