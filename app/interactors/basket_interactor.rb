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

  def detail
    @basket = Basket.find_by_session_id(@session_id)
    if @basket
      basket_detail_json
    else
      empty_basket_json
    end
  end

  private

  def basket_detail_json
    basket_json(basket.basket_items.map{|bi| bi.number_of_item}.sum,
                0,
                @basket.basket_items)
  end

  def empty_basket_json
    basket_json
  end

  def basket_json(total_items=0, total_amount=0, items={})
    { total_items: total_items,
      total_amount: total_amount,
      items: items
    }.to_json
  end

  def add_item_to_basket
    exist_basket_item = @basket.basket_items.select {|basket_item| basket_item.menu_id == @menu_id}
    if !exist_basket_item.empty?
      exist_basket_item[0].number_of_item = exist_basket_item[0].number_of_item + 1
      exist_basket_item[0].save
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