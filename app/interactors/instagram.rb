class Instagram

  INSTAGRAM_URI="https://api.instagram.com/v1/tags/%s?access_token=%s"

  attr_accessor :instagram_tag

  def initialize
    @instagram_tag = Promo.instagram_tag
    number
  end

  def number
    uri = INSTAGRAM_URI % [@instagram_tag, Settings.instagram.access_token]
    parse_response(HTTParty.get(uri))
  end

  def parse_response(response)
    if response.present? &&
        response['meta']['code'] == 200
      current_no_of_tag = InstagramTagNumber.find(@instagram_tag)
      if current_no_of_tag < response['data']['media_count']
        InstagramTagNumber.create(tag_number: response['data']['media_count'],
                                  tag: response['data']['name'],
                                  fetch_date: Time.now.to_s)
      end
    end
  end
end