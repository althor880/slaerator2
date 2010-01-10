class SfCasesController < ApplicationController

  def analyze

    @case = Salesforce::Case.find_by_id(params[:sfid])
    @sf_case = SfCase.find_by_sfid(params[:sfid])
    @priority = if starting_priority = @case.case_histories.find_all_by_field("Priority", :order => "CreatedDate").first.old_value
                  starting_priority
                else
                  @case.priority
                end

    @created_date = @case.case_histories.find_by_field("created").created_date.to_datetime

    
    
  end

end
