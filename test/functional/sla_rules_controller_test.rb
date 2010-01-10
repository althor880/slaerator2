require 'test_helper'

class SlaRulesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => SlaRule.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    SlaRule.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    SlaRule.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to sla_rule_url(assigns(:sla_rule))
  end
  
  def test_edit
    get :edit, :id => SlaRule.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    SlaRule.any_instance.stubs(:valid?).returns(false)
    put :update, :id => SlaRule.first
    assert_template 'edit'
  end
  
  def test_update_valid
    SlaRule.any_instance.stubs(:valid?).returns(true)
    put :update, :id => SlaRule.first
    assert_redirected_to sla_rule_url(assigns(:sla_rule))
  end
  
  def test_destroy
    sla_rule = SlaRule.first
    delete :destroy, :id => sla_rule
    assert_redirected_to sla_rules_url
    assert !SlaRule.exists?(sla_rule.id)
  end
end
