class DeliveryCoverageController < ApplicationController

  def show
    is_within_coverage = DeliveryCoverageInteractor.within_coverage_area(params[:id])
    status = is_within_coverage[:status] ? :ok : :not_found
    render text: is_within_coverage[:message], status: status
  end

end