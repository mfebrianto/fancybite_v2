class FacebookUserInteractor

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

    # get feeds from group:
    # https://graph.facebook.com/v2.1/211559605634024/feed?access_token=CAAYSzbCEjGQBAH3ZAPV7sRc0v7IqEkRevWo2bdnrkeTdVsNPLUUlJR1kqIxpzsHIse1w3c9ZCt5A9lL57W70WYzh7tE1zZCEeZBimhryubp6VFBISCO3xCW6lVZC6qmbP4oqVL0EoRsiUOYlHhhQN7TfElYuIjzI5ZCU8sqojzFH4hcfYKqF5rKh5sRf8WRdDEN5xOJErvQgZDZD
  end

  def self.post_to_my_wall
    # doc: https://developers.facebook.com/docs/graph-api/reference/v2.0/user/feed
    facebook_user_data = FacebookUser.last
    url = "https://graph.facebook.com/v2.0/me/feed?access_token=#{facebook_user_data.token}"

    @result = HTTParty.post(url,
                            :body => { message: 'test' }.to_json,
                            :headers => { 'Content-Type' => 'application/json' } )

    p ">>>>>>>@result>>>>#{@result}"
  end

  def self.post_to_my_page
    # TODO: need refinement
    # doc: https://developers.facebook.com/docs/pages/publishing
    facebook_user_data = FacebookUser.last
    url = "https://graph.facebook.com/669537146501632/feed?access_token=#{facebook_user_data.token}"

    @result = HTTParty.post(url,
                            :body => { message: 'test' }.to_json,
                            :headers => { 'Content-Type' => 'application/json' } )

    p ">>>>>>>@result>>>>#{@result}"
  end

  def self.post_to_group
    # TODO: for now only to 'the rock' group
    # doc: https://developers.facebook.com/docs/pages/publishing
    facebook_user_data = FacebookUser.last
    url = "https://graph.facebook.com/211559605634024/feed?access_token=#{facebook_user_data.token}"

    @result = HTTParty.post(url,
                            :body => { message: 'test' }.to_json,
                            :headers => { 'Content-Type' => 'application/json' } )

    p ">>>>>>>@result>>>>#{@result}"
  end

end