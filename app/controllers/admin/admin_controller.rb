class Admin::AdminController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  authorize_resource class: false
  # load_resource

end