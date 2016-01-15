class Menu < ActiveRecord::Base

  has_attached_file :avatar, styles: { large: "960x511>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

end