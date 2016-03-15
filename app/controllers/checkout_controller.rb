class CheckoutController < ApplicationController

  def new
    @customer = Customer.new
  end

  def create
    CheckoutInteractor.new.create_transaction
    render partial: 'checkout/customer_detail'
  end

end