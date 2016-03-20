class MenusController < ApplicationController

  def index
    @foods_array_of_3 = convert_array_to_dimension(Menu.all, 3)
    @show_checkout_button = true
  end

  def show
    @food = Menu.find(params[:id])
    @show_checkout_button = true
  end

  private

  def convert_array_to_dimension(original_array, new_dimension)
    index = 1
    order = 1
    result_array = []
    temp_array = []
    original_array.each do |array_member|
      temp_array << array_member

      if index == new_dimension || (order == original_array.count)
        index = 0
        result_array << temp_array
        temp_array = []
      end

      order += 1
      index += 1
    end
    result_array
  end
end