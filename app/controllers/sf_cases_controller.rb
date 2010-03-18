class SfCasesController < ApplicationController
  before_filter :require_user
  def analyze
    @sf_case = SfCase.find_by_sfid(params[:id])
  end
  def analyze_all
    @sf_case_ids = params[:id].split(',')
    @sf_cases = SfCase.find_all_by_sfid(@sf_case_ids)
    logger.info "Number of cases: #{@sf_cases.length}"
  end
end
