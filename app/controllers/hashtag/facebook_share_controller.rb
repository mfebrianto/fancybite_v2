require 'base64'

class Hashtag::FacebookShareController < ApplicationController

  def create
    Rails.logger.info ">>>>>publishing"

    social = Social.last
    social.social_images.last

    # 'https://fancybite.com.au'

    # Base64.encode64(File.open(Social.last.social_images.last.picture.path).read)

    # image_file = File.new(Social.last.social_images.last.picture.path, 'rb')

    image_file = Social.last.social_images.last.picture.path

    Hashtag::FacebookShareInteractor.post_to_group(social.description, '')

    render nothing: true, status: :ok
  end


end