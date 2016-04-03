class Admin::SocialsController < Admin::AdminController

  def index

  end

  def new
    @social = Social.new
  end

end