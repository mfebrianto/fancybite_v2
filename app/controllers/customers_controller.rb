class CustomersController < ApplicationController

  def create
    p ">>>>>>>>#{params.inspect}"
    render nothing: true, status: :ok
  end


end