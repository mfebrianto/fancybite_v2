class DeliveryTimeScheduleController < ApplicationController

  def show
    delivery_time_schedule = DeliveryTimeSchedule.find(params['id'])
    status = delivery_time_schedule ? :ok : :not_found
    render json: delivery_time_schedule, status: status
  end

end