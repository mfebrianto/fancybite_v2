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

  private


  def show_all
    @social_images = SocialImage
  end

end