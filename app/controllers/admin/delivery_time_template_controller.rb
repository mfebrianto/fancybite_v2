class Admin::DeliveryTimeTemplateController < Admin::AdminController

  def index
    @delivery_time_templates = DeliveryTimeTemplate.all
  end

end