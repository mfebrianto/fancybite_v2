class Payments::PaypalController < ApplicationController

  def new
    response = EXPRESS_GATEWAY.setup_purchase(YOUR_TOTAL_AMOUNT_IN_CENTS,
                                              ip: request.remote_ip,
                                              return_url: YOUR_RETURN_URL_,
                                              cancel_return_url: YOUR_CANCEL_RETURL_URL,
                                              currency: "USD",
                                              allow_guest_checkout: true,
                                              items: [{name: "Order", description: "Order description", quantity: "1", amount: AMOUNT_IN_CENTS}]
    )
    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end

end