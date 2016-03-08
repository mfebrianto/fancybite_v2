class BasketInteractor

  attr_accessor :session_id, :menu_id, :basket, :user_id

  def initialize(params)
    @session_id = params[:session_id]
    @menu_id = params[:menu_id]
    @user_id = params[:user_id]
  end

  def create_or_update
    @basket = Basket.find_by_session_id(@session_id)
    if @basket
      add_item_to_basket
    else
      create_basket
    end
  end

  private

  def add_item_to_basket
    exist_basket_item = []
    exist_basket_item << @basket.basket_items.select {|basket_item| basket_item.menu_id == @menu_id}
    if !exist_basket_item.empty?
    else
      @basket.basket_items << BasketItem.create(menu_id: @menu_id)
    end

  end

  def create_basket
    @basket = Basket.new(session_id: @session_id,
                            user_id: @user_id)
    @basket.basket_items.build(menu_id: @menu_id)
    @basket.save
  end

end