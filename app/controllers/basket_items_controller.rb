class BasketItemsController < ApplicationController

  def destroy
    basket_item = BasketItem.find(params['id'])
    if basket_item && basket_item.delete
      render json: BasketInteractor.new(session_id: request.session_options[:id]).detail, status: :ok
    else
      render nothing: true, status: :not_found
    end
  end

end