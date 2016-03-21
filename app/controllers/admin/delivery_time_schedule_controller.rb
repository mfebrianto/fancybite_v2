class Admin::DeliveryTimeScheduleController < Admin::AdminController

  def index
    # @delivery_time_templates = DeliveryTimeTemplate.all
  end

  def edit
    # @delivery_time_templates = DeliveryTimeTemplate.all
  end

  def update_all
    # params['delivery_time_template'].each do |id, val|
    #   delivery_time_template = DeliveryTimeTemplate.find(id)
    #   delivery_time_template.update_attributes(form_params(val))
    # end
    # redirect_to action: 'index'
  end

  private

  def form_params(val)
    # { morning: val['morning'],
    #   afternoon: val['afternoon'],
    #   evening: val['evening'] }
  end
end