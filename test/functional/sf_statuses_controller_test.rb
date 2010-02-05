require 'test_helper'

class SfStatusesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => SfStatus.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    SfStatus.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    SfStatus.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to sf_status_url(assigns(:sf_status))
  end
  
  def test_edit
    get :edit, :id => SfStatus.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    SfStatus.any_instance.stubs(:valid?).returns(false)
    put :update, :id => SfStatus.first
    assert_template 'edit'
  end
  
  def test_update_valid
    SfStatus.any_instance.stubs(:valid?).returns(true)
    put :update, :id => SfStatus.first
    assert_redirected_to sf_status_url(assigns(:sf_status))
  end
  
  def test_destroy
    sf_status = SfStatus.first
    delete :destroy, :id => sf_status
    assert_redirected_to sf_statuses_url
    assert !SfStatus.exists?(sf_status.id)
  end
end
