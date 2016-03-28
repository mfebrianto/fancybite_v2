class DeliveryCoverageInteractor

  def self.within_coverage_area(postcode)
    result = {status: true}
    if postcode[0] != '2'
      result[:message] = I18n.t('dashboard.checkout.coverage_nsw_only')
      result[:status] = false
      return result
    end

    postcode_in_db = DeliveryCoverage.find_by_postcode(postcode)
    if postcode[0] == '2' && !postcode_in_db
      result[:message] = I18n.t('dashboard.checkout.address_outside_coverage')
      result[:status] = false
    end
    result
  end

end