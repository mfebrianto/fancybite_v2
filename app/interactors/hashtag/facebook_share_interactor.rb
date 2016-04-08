class Hashtag::FacebookShareInteractor

  attr_accessor :params, :current_user

  def initialize(attributes = {})
    attributes.each do |k,v|
      send("#{k}=", v)
    end
  end

  def process
    facebook_user = FacebookUser.new(user_id: current_user.id,
                                     expires: params.credentials.expires,
                                     expires_at: params.credentials.expires_at,
                                     token: params.credentials.token,
                                     email: params.extra.raw_info.email,
                                     image: params.info.image,
                                     name: params.extra.raw_info.name,
                                     uid: params.uid)
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