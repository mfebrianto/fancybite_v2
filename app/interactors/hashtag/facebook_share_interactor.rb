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

  def self.post_to_my_wall(description)
    # doc: https://developers.facebook.com/docs/graph-api/reference/v2.0/user/feed

    # Hashtag::FacebookShareInteractor.post_to_my_wall(Social.last.description)
    # TODO: need to setup user that will do sharing
    facebook_user_data = FacebookUser.last

    me = FbGraph2::User.me(facebook_user_data.token)
    me_fetch = me.fetch

    Rails.logger.info ">>>>#{me.edges}"

    Rails.logger.info "user : #{me_fetch.name}"

    image_file = Social.last.social_images.last.picture.path

    # me.photo!(
    #   message: 'test',
    #   source: open(image_file)
    # )

    # @result = HTTParty.post(url,
    #                         body: { message: description }.to_json,
    #                         headers: { 'Content-Type' => 'application/json' } )

    Rails.logger.info "facebook post result: #{@result.inspect}"
  end

  def self.post_to_group(description, link)
    # TODO: for now only to 'the rock' group
    # docs:
    # https://developers.facebook.com/docs/graph-api/reference/v2.3/post
    # https://developers.facebook.com/docs/graph-api/reference/v2.3/group/photos
    facebook_user_data = FacebookUser.last
    # url = "https://graph.facebook.com/211559605634024/feed?access_token=#{facebook_user_data.token}"
    #
    # @result = HTTParty.post(url,
    #                         body: { message: description,
    #                                 link: link }.to_json,
    #                         headers: { 'Content-Type' => 'application/json' } )

    # url = "https://graph.facebook.com/211559605634024/photos?access_token=#{facebook_user_data.token}"

    # @result = HTTParty.post(url,
    #                         body: { message: description,
    #                                 source: open(link) },
    #                         headers: { 'Content-Type' => 'application/json' } )

    group = FbGraph2::Group.new('211559605634024').authenticate(facebook_user_data.token)

    Rails.logger.info(">>>>>>#{group.edges}")

    image_file = Social.last.social_images.last.picture.path

    group.photo!(
      message: 'test',
      source: open(image_file)
    )


    Rails.logger.info "facebook post result: #{@result.inspect}"
  end
end