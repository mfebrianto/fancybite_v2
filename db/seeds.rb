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
FeatureControl.seed_create(id: 1, name: 'shop', description: 'this toggle is to allowed customer to buy product', disabled: true)
FeatureControl.seed_create(id: 2, name: 'login', description: 'this toggle is to allowed customer to check their order status and history', disabled: false)

Promo.delete_all
Promo.seed_create(id: 1, name: 'instagram tag', code: 'fancybite_oz')