class SfCasesController < ApplicationController

def analyze


    @case = Salesforce::Case.find_by_id(params[:id])
    @sf_case = SfCase.find_by_sfid(params[:id])
    
  end
end
