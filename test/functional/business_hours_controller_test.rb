require 'test_helper'

class BusinessHoursControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => BusinessHour.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    BusinessHour.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    BusinessHour.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to business_hour_url(assigns(:business_hour))
  end
  
  def test_edit
    get :edit, :id => BusinessHour.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    BusinessHour.any_instance.stubs(:valid?).returns(false)
    put :update, :id => BusinessHour.first
    assert_template 'edit'
  end
  
  def test_update_valid
    BusinessHour.any_instance.stubs(:valid?).returns(true)
    put :update, :id => BusinessHour.first
    assert_redirected_to business_hour_url(assigns(:business_hour))
  end
  
  def test_destroy
    business_hour = BusinessHour.first
    delete :destroy, :id => business_hour
    assert_redirected_to business_hours_url
    assert !BusinessHour.exists?(business_hour.id)
  end
end
