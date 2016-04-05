fancybite.admin.social = {
    init: function() {
        console.log('admin social init');
        fancybite.admin.social.listeners();
    },
    listeners: function() {
        $('#upload_social_photo').click(function(e){
            e.preventDefault();
            fancybite.admin.social.saveImage();
        });

        $('#social_submission_button').click(function(e){
            e.preventDefault();
            console.log('test');
            $('#social_id_for_submission').val($('#social_id').val());
            $('.new_social').submit();
        });
    },
    saveImage : function(){
        var formData = new FormData();
        formData.append('picture', $('#picture')[0].files[0]);
        formData.append('social_id', $('#social_id').val());

        $.ajax({
            type: 'POST',
            url: '/admin/social_images',
            data: formData,
            processData: false,
            contentType: false,
            success: function(data){
                $('#new-social-image-wrapper').replaceWith(data);
                fancybite.admin.social.init();
            }
        });
    }
}

