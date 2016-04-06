class Admin::SocialSchedulesController < Admin::AdminController

  def show
    @social = Social.find(params[:id])
  end

  def edit
    @social = Social.find(params[:id])
  end

end