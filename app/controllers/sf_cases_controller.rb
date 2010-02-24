class SfCasesController < ApplicationController
  def analyze
    @sf_case = SfCase.find_by_sfid(params[:id])
  end
end
