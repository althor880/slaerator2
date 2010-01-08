require 'test_helper'

class SfRecordTypesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => SfRecordType.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    SfRecordType.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    SfRecordType.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to sf_record_type_url(assigns(:sf_record_type))
  end
  
  def test_edit
    get :edit, :id => SfRecordType.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    SfRecordType.any_instance.stubs(:valid?).returns(false)
    put :update, :id => SfRecordType.first
    assert_template 'edit'
  end
  
  def test_update_valid
    SfRecordType.any_instance.stubs(:valid?).returns(true)
    put :update, :id => SfRecordType.first
    assert_redirected_to sf_record_type_url(assigns(:sf_record_type))
  end
  
  def test_destroy
    sf_record_type = SfRecordType.first
    delete :destroy, :id => sf_record_type
    assert_redirected_to sf_record_types_url
    assert !SfRecordType.exists?(sf_record_type.id)
  end
end
