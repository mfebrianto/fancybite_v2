class DeliveryTimeTemplateInteractor

  def self.create_delivery_schedule
    not_exist_days.each do |date|
      template = DeliveryTimeTemplate.find_by_day(date.strftime("%A").downcase)
      schedule = { schedule_date: date,
                   morning: template.morning,
                   afternoon: template.afternoon,
                   evening: template.evening
      }
      DeliveryTimeSchedule.create(schedule)
    end
  end

  def self.not_exist_days
    not_exist = []
    seven_days_ahead.each do |date|
      not_exist << date unless DeliveryTimeSchedule.find_by_schedule_date(date)
    end
    not_exist
  end

  def self.seven_days_ahead
    next_week_dates = []
    tomorrow = Date.today
    7.times do
      tomorrow = tomorrow + 1
      next_week_dates << tomorrow
    end
    next_week_dates
  end

end