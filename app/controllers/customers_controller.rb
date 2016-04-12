class CustomersController < ApplicationController

  def create
    checkout = Checkout.new
    checkout.build_customer(customer_params)
    checkout.save
    render json: {checkout_id: checkout.id}, status: :ok
  end

  private

  def customer_params
    params.require(:customer).permit(:given_name, :sure_name, :email, :phone_number,
                                     :address, :suburb, :city, :postcode)
  end


end