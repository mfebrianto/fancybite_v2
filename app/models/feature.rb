class Feature < ActiveRecord::Base

  has_attached_file :picture_small, styles: { large: "960x511>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  has_attached_file :picture_large, styles: { large: "960x511>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture_small, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :picture_large, content_type: /\Aimage\/.*\Z/


  validate :image_dimensions_small, if: Proc.new { |a| a.picture_small.queued_for_write[:original].present? }
  validate :image_dimensions_large, if: Proc.new { |a| a.picture_large.queued_for_write[:original].present? }

  private

  def image_dimensions_small
    required_width  = 300
    required_height = 300
    dimensions = Paperclip::Geometry.from_file(picture_small.queued_for_write[:original].path)

    errors.add(:picture_small, "Width must be #{required_width}px") unless dimensions.width == required_width
    errors.add(:picture_small, "Height must be #{required_height}px") unless dimensions.height == required_height
  end

  def image_dimensions_large
    required_width  = 950
    required_height = 300
    dimensions = Paperclip::Geometry.from_file(picture_large.queued_for_write[:original].path)

    errors.add(:picture_large, "Width must be #{required_width}px") unless dimensions.width == required_width
    errors.add(:picture_large, "Height must be #{required_height}px") unless dimensions.height == required_height
  end

end