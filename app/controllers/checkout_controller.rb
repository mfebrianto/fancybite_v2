class CheckoutController < ApplicationController

  def new
    basket_detail = BasketInteractor.new(session_id: request.session_options[:id]).detail_hash
    p ">>basket_detail>>>>#{basket_detail.inspect}"
    @basket_total_amount = basket_detail['total_amount']
    @basket_items_number = basket_detail['total_items']
    @basket_items = basket_detail['items']
    @show_checkout_button = false
    @show_remove_item_button = false
    @customer = Customer.new
  end

  def create
    CheckoutInteractor.new.create_transaction
    render partial: 'checkout/customer_detail'
  end

end