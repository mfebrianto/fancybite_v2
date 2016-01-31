class InstagramTagNumber < ActiveRecord::Base

  INSTAGRAM_URI="https://api.instagram.com/v1/tags/%s?access_token=%s"

  def number
    tag = Promo.find
    uri = printf(INSTAGRAM_URI, )
    Net::HTTP.new(uri)

  end

end