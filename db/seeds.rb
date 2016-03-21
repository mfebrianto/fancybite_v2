# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

class ActiveRecord::Base
  def self.seed_create(attributes)
    new(attributes, without_protection: true).save(validate: false)
  end
end

FeatureControl.delete_all
FeatureControl.seed_create(id: 1, name: 'shop', description: 'this toggle is to allowed customer to buy product', disabled: false)
FeatureControl.seed_create(id: 2, name: 'login', description: 'this toggle is to allowed customer to check their order status and history', disabled: true)
FeatureControl.seed_create(id: 3, name: 'checkout', description: 'this toggle is to allowed customer to finalise their order', disabled: true)

Promo.delete_all
Promo.seed_create(id: 1, name: 'instagram tag', code: 'fancybite_oz')

DeliveryTimeTemplate.delete_all
DeliveryTimeTemplate.seed_create(id: 1, day: 'monday', morning: false, afternoon: true, evening: true)
DeliveryTimeTemplate.seed_create(id: 2, day: 'tuesday', morning: false, afternoon: true, evening: true)
DeliveryTimeTemplate.seed_create(id: 3, day: 'wednesday', morning: false, afternoon: true, evening: true)
DeliveryTimeTemplate.seed_create(id: 4, day: 'thursday', morning: false, afternoon: true, evening: false)
DeliveryTimeTemplate.seed_create(id: 5, day: 'friday', morning: false, afternoon: true, evening: true)
DeliveryTimeTemplate.seed_create(id: 6, day: 'saturday', morning: true, afternoon: true, evening: true)
DeliveryTimeTemplate.seed_create(id: 7, day: 'sunday', morning: true, afternoon: true, evening: true)