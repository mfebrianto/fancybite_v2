module CheckoutHelper

  def delivery_dates
    available_schedules = DeliveryTimeSchedule.where("schedule_date > ?", Date.today + Settings.order.days_ahead.days)
    available_days = []
    available_schedules.each do |schedule|
      available_days << [schedule.schedule_date.strftime("%A, %d-%m-%Y"), schedule.id]
    end
    available_days
  end

  def first_delivery_time
    DeliveryTimeSchedule.find(delivery_dates.last[1])
  end

  def class_shown(delivery_status)
    delivery_status ? '' : 'disabled'
  end

end