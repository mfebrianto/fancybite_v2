fancybite.admin.social = {
    init: function() {
        console.log('admin social init');
        fancybite.admin.social.listeners();
    },
    listeners: function() {
        $('#upload_social_photo').click(function(e){
            e.preventDefault();
            console.log('button clicked');

            var formData = new FormData();
            formData.append('picture', $('#picture')[0].files[0]);

            var other_data = $('#social_image_form').serializeArray();
            $.each(other_data,function(key,input){
                formData.append(input.name,input.value);
            });

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
        });
    }
}

