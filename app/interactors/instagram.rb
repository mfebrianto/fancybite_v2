class Instagram

  INSTAGRAM_URI="https://api.instagram.com/v1/tags/%s?access_token=%s"

  def self.number
    tag = Promo.instagram_tag
    uri = INSTAGRAM_URI % [tag, Settings.instagram.access_token]
    response = HTTParty.get(uri)
    response
  end

end