class Admin::SocialsController < Admin::AdminController

  def index
    @socials = Social.where(ready: true)
  end

  def new
    @social = Social.new
  end

  def create
    if params[:social_id_for_submission].present?
      social = Social.find(params[:social_id_for_submission])
      if social.update_attributes(ready: true,
                                  description: params['social']['description'])
        @socials = Social.where(ready: true)
        render action: 'index'
      else
        @social = Social.new
        render action: 'new'
      end
    else
      @social = Social.new
      render action: 'new'
    end
  end

  def edit
    @social = Social.find(params[:id])
  end

  def update
    @social = Social.find(params[:social_id_for_submission])
    if @social.update_attributes(description: params['social']['description'])
      render action: 'edit'
    end
  end
end