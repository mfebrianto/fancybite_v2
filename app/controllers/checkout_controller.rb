class CheckoutController < ApplicationController

  def new
    @customer = Customer.new
  end

end