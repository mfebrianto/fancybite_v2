module ApplicationHelper

  SHOP = 1

  def customer_buy_active?
    !FeatureControl.find(SHOP).disabled?
  end
end
