require 'base64'

class Hashtag::FacebookShareController < ApplicationController

  def create
    social = Social.find(params[:id])
    image_file = social.social_images.last.picture.path

    Hashtag::FacebookShareInteractor.post_to_group(social.description, image_file)

    render nothing: true, status: :ok
  end


end