class Basket < ActiveRecord::Base

  has_many :basket_items

  def basket_items_with_item_price
    basket_items_result = []
    basket_items.each do |bi|
      single_bi = bi.attributes.merge!({'price' => bi.menu.price.to_f,
                                        'name' => bi.menu.name})
      basket_items_result << single_bi
    end
    basket_items_result
  end

end