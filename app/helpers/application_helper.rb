module ApplicationHelper

  SHOP = 1
  LOGIN = 2

  def customer_buy_active?
    !FeatureControl.find(SHOP).disabled?
  end

  def login_active?
    !FeatureControl.find(LOGIN).disabled?
  end
end
