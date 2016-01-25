class Admin::MenusController < Admin::AdminController

  def index
    @all_menu = Menu.all
  end

  def new
    @menu = Menu.new
  end

  def edit
    @menu = Menu.find(param_id['id'])
  end

  def update
    @menu = Menu.find(param_id['id'])
    if @menu.update_attributes(menu_params)
      render 'show'
    else
      render 'edit'
    end
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.save
    render 'show'
  end

  def show
    @menu = Menu.find(param_id['id'])
  end

  def destroy
    @menu = Menu.find(param_id['id'])
    if @menu.delete
      @all_menu = Menu.all
      render 'index'
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :description, :price, :picture, :portfolio, :featured)
  end

  def param_id
    params.permit(:id)
  end

end