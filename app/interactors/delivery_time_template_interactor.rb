class DeliveryTimeTemplateInteractor

  def self.create_delivery_schedule
    today = Date.today
    days_from_this_week = (today.at_beginning_of_week..today.at_end_of_week).map.each { |day| day }

    days_from_this_week.each do |day|
      DeliveryTimeSchedule.find_by_schedule_date(day).delete
    end

    delivery_time_template = DeliveryTimeTemplate.all

    index = 0
    delivery_time_template.each do |delivery|
      schedule = { schedule_date: days_from_this_week[index],
                   morning: delivery.morning,
                   afternoon: delivery.afternoon,
                   evening: delivery.evening
      }
      DeliveryTimeSchedule.create(schedule)
      index+=1
    end
  end

end