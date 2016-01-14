class Admin::MenuController < Admin::AdminController

  def index

  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.save
    render 'show'
  end

  def show

  end

  private

  def menu_params
    params.require(:menu).permit(:name, :description, :price)
  end

end