class FacebookUserInteractor

  attr_accessor :params, :current_user

  def initialize(attributes = {})
    attributes.each do |k,v|
      send("#{k}=", v)
    end
  end

  def process
    p ">>>>>#{params.inspect}"
    p ">>>>>#{params.extra.raw_info.inspect}"
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

end