class Admin::DeliveryTimeTemplateController < Admin::AdminController

  def index
    @delivery_time_templates = DeliveryTimeTemplate.all
  end

  def edit
    @delivery_time_templates = DeliveryTimeTemplate.all
  end

  def update_all

  end

end