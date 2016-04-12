class PaymentsController < ApplicationController

  def create
    payment = Payment.new(checkout_id: params[:checkout_id],
                          ip: request.remote_ip)
    payment.save
    render nothing: true, status: :ok
  end

end