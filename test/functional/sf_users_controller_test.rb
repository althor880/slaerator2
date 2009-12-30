require 'test_helper'

class SfUsersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => SfUser.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    SfUser.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    SfUser.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to sf_user_url(assigns(:sf_user))
  end
  
  def test_edit
    get :edit, :id => SfUser.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    SfUser.any_instance.stubs(:valid?).returns(false)
    put :update, :id => SfUser.first
    assert_template 'edit'
  end
  
  def test_update_valid
    SfUser.any_instance.stubs(:valid?).returns(true)
    put :update, :id => SfUser.first
    assert_redirected_to sf_user_url(assigns(:sf_user))
  end
  
  def test_destroy
    sf_user = SfUser.first
    delete :destroy, :id => sf_user
    assert_redirected_to sf_users_url
    assert !SfUser.exists?(sf_user.id)
  end
end
