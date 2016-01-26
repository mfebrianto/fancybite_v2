class FeatureControlsController < Admin::AdminController

  def index
    @feature_controls = FeatureControl.all
  end

end