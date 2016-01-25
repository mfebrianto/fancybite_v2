class Admin::FeaturesController < Admin::AdminController

  def index
    @all_features = Feature.all
  end

  def new
    @feature = Feature.new
  end

  def edit
    @feature = Feature.find(param_id['id'])
  end

  def update
    @feature = Feature.find(param_id['id'])
    if @feature.update_attributes(menu_params)
      render 'show'
    else
      render 'edit'
    end
  end

  def create
    @feature = Feature.new(menu_params)
    @feature.save
    render 'show'
  end

  def show
    @feature = Feature.find(param_id['id'])
  end

  def destroy
    @feature = Feature.find(param_id['id'])
    if @feature.delete
      @all_features = Feature.all
      render 'index'
    end
  end

  private

  def menu_params
    params.require(:feature).permit(:name, :description, :start_date, :end_date, :picture_small, :picture_large)
  end

  def param_id
    params.permit(:id)
  end

end