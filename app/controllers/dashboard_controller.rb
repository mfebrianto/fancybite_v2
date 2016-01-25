class DashboardController < ApplicationController

  def index
    # binding.pry
    @awesome_products = Menu.all
    @portfolio_products = Menu.where(portfolio: true)
    @featured_products = Feature.all
  end

end