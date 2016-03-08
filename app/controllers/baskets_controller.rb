class BasketsController < ApplicationController

  def create
    basket_interactor_param = {session_id: request.session_options[:id],
                               menu_id: params['id']}
    basket_interactor_param.merge!(user_id: current_user.id) if current_user.present?
    BasketInteractor.new(basket_interactor_param).create_or_update
    render nothing: true, status: :ok
  end

  def index
    render json: BasketInteractor.new(session_id: request.session_options[:id]).detail
  end

end