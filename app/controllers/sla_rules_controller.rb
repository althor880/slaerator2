class SlaRulesController < ApplicationController
  def index
    @sla_rules = SlaRule.all
  end
  
  def show
    @sla_rule = SlaRule.find(params[:id])
  end
  
  def new
    @sla_rule = SlaRule.new
  end
  
  def create
    @sla_rule = SlaRule.new(params[:sla_rule])
    if @sla_rule.save
      flash[:notice] = "Successfully created sla rule."
      redirect_to @sla_rule
    else
      render :action => 'new'
    end
  end
  
  def edit
    @sla_rule = SlaRule.find(params[:id])
  end
  
  def update
    @sla_rule = SlaRule.find(params[:id])
    if @sla_rule.update_attributes(params[:sla_rule])
      flash[:notice] = "Successfully updated sla rule."
      redirect_to @sla_rule
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @sla_rule = SlaRule.find(params[:id])
    @sla_rule.destroy
    flash[:notice] = "Successfully destroyed sla rule."
    redirect_to sla_rules_url
  end
end
