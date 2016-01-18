class MenusController < ApplicationController

  def index
    @foods_array_of_3 = convert_array_to_dimension(Menu.all, 3)
  end

  private

  def convert_array_to_dimension(original_array, new_dimension)
    index = 0
    result_array = []
    temp_array = []
    original_array.each do |array_member|
      if index == new_dimension
        index = 0
        result_array << temp_array
        temp_array = []
      end

      temp_array << array_member
      Rails.logger.info ">>>>>>>temp_array>>>>#{temp_array}"
      index += 1
    end
    result_array
  end

end