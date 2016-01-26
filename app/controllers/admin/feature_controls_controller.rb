class Admin::FeatureControlsController < Admin::AdminController

  def index
    @feature_controls = FeatureControl.all
  end

  def edit
    @feature_controls = FeatureControl.all
  end

end