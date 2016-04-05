class Admin::SocialImagesController < Admin::AdminController

  def create
    social = params[:social_id].blank? ? Social.new : Social.find(params[:social_id])

    social.social_images.build(picture: params[:picture])
    if social.save
      @social = social
      show_all
      render partial: 'admin/social_images/new'
    end
  end

  def destroy
    image = SocialImage.find(params[:id])
    id = image.social.id
    image.destroy
    redirect_to edit_admin_social_url(id)
  end
end