class Admin::DeliveryCoverageController < Admin::AdminController

  def index
    @delivery_coverages = DeliveryCoverage.all
  end

  def new
    @delivery_coverage = DeliveryCoverage.new
  end

  def create
    @delivery_coverage = DeliveryCoverage.new(delivery_coverage_params)
    if @delivery_coverage.create
      render action: 'index'
    else
      render 'new'
    end
  end

  private

  def delivery_coverage_params
    params.require(:delivery_coverage).permit(:postcode, :drop_point)
  end

end