class Promo < ActiveRecord::Base

  def self.instagram_tag
    self.find(1).code
  end

end