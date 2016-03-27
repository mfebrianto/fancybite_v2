class DeliveryCoverageController < ApplicationController

  def show
    status = DeliveryCoverage.find_by_postcode(params[:id]) ? :ok : :not_found
    render nothing: true, status: status
  end

end