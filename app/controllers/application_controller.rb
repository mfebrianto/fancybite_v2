class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
     current_user.admin? ? admin_dashboard_index_url : dashboard_index_url
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to dashboard_index_url
  end
end
