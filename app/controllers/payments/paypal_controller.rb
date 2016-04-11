class Payments::PaypalController < ApplicationController

  def new
    response = EXPRESS_GATEWAY.setup_purchase(300,
                                              ip: request.remote_ip,
                                              return_url: new_payments_confirmation_url,
                                              cancel_return_url: new_checkout_url,
                                              currency: 'AUD',
                                              allow_guest_checkout: true,
                                              items: [{name: 'Order', description: 'Order description', quantity: '1', amount: 300}]
    )

    p ">>>>>#{response.inspect}"

    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end

end