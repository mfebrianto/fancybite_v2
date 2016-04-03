class SocialImage < ActiveRecord::Base

  belongs_to :social

  has_attached_file :picture, styles: { thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

end