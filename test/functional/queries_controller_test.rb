require 'test_helper'

class QueriesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Query.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Query.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Query.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to query_url(assigns(:query))
  end
  
  def test_edit
    get :edit, :id => Query.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Query.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Query.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Query.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Query.first
    assert_redirected_to query_url(assigns(:query))
  end
  
  def test_destroy
    query = Query.first
    delete :destroy, :id => query
    assert_redirected_to queries_url
    assert !Query.exists?(query.id)
  end
end
