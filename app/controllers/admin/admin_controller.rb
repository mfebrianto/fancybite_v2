class Admin::AdminController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  authorize_resource class: false
  # load_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_url
  end

end