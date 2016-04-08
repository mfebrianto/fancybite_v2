class Hashtag::FacebookShareInteractor

  attr_accessor :params, :current_user

  def initialize(attributes = {})
    attributes.each do |k,v|
      send("#{k}=", v)
    end
  end

  def process
    facebook_user = FacebookUser.find_or_initialize_by(id: current_user.id)
    facebook_user.user_id = current_user.id
    facebook_user.expires = params.credentials.expires
    facebook_user.expires_at = params.credentials.expires_at
    facebook_user.token = params.credentials.token
    facebook_user.email = params.extra.raw_info.email
    facebook_user.image = params.info.image
    facebook_user.name = params.extra.raw_info.name
    facebook_user.uid = params.uid
    facebook_user.save
  end

  def self.post_to_my_wall
    # doc: https://developers.facebook.com/docs/graph-api/reference/v2.0/user/feed
    facebook_user_data = FacebookUser.last
    url = "https://graph.facebook.com/v2.0/me/feed?access_token=#{facebook_user_data.token}"

    @result = HTTParty.post(url,
                            body: { message: 'test' }.to_json,
                            headers: { 'Content-Type' => 'application/json' } )
    Rails.logger.info "facebook post result: #{@result.inspect}"
  end

end