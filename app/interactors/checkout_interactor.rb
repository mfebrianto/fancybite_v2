class CheckoutInteractor

  def initialize

  end

  def create_transaction
    client_token = Braintree::ClientToken.generate
    p ">>>>>client_token>>>>#{client_token}"

    fake_nonce = 'fake-valid-mastercard-nonce'

    result = Braintree::Transaction.sale(
        :amount => "100.00",
        :payment_method_nonce => fake_nonce,
        :options => {
            :submit_for_settlement => true
        }
    )

    p ">>>>>result>>>>#{result.inspect}"
  end

end