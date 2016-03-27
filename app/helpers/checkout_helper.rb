module CheckoutHelper

  def delivery_dates
    available_schedules = DeliveryTimeSchedule.where("schedule_date > ?", Date.today)
    available_days = []
    available_schedules.each do |schedule|
      available_days << [schedule.schedule_date.strftime("%A, %d-%m-%Y"), schedule.id]
    end
    available_days
  end

end