class Menu < ActiveRecord::Base

  has_attached_file :picture, styles: { large: "960x511>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  validate :image_dimensions, if: Proc.new { |a| a.picture.queued_for_write[:original].present? }
  validates :name, :description, :price, :picture, presence: true

  private

  def image_dimensions
    required_width  = 300
    required_height = 200
    dimensions = Paperclip::Geometry.from_file(picture.queued_for_write[:original].path)

    errors.add(:picture, "Width must be #{required_width}px") unless dimensions.width == required_width
    errors.add(:picture, "Height must be #{required_height}px") unless dimensions.height == required_height
  end
end