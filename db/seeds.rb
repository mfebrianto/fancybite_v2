# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

FeatureControl.delete_all
FeatureControl.create(name: 'shop', description: 'this toggle is to allowed customer to buy product', disabled: true)

Promo.delete_all
Promo.create(id: 1, name: 'instagram tag', code: 'fancybite_oz')