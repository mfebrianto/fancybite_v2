class Admin::FeatureControlsController < Admin::AdminController

  def index
    @feature_controls = FeatureControl.all
  end

  def edit
    @feature_controls = FeatureControl.all
  end

  def update_all
    params['feature_control'].each do |k, v|
      fc = FeatureControl.find(k.to_s)
      fc.update_attributes(disabled: v)
    end
    redirect_to action: 'index'
  end

end