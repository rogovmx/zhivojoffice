require 'test_helper'

class Indexnew1sControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:indexnew1s)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_indexnew1
    assert_difference('Indexnew1.count') do
      post :create, :indexnew1 => { }
    end

    assert_redirected_to indexnew1_path(assigns(:indexnew1))
  end

  def test_should_show_indexnew1
    get :show, :id => indexnew1s(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => indexnew1s(:one).id
    assert_response :success
  end

  def test_should_update_indexnew1
    put :update, :id => indexnew1s(:one).id, :indexnew1 => { }
    assert_redirected_to indexnew1_path(assigns(:indexnew1))
  end

  def test_should_destroy_indexnew1
    assert_difference('Indexnew1.count', -1) do
      delete :destroy, :id => indexnew1s(:one).id
    end

    assert_redirected_to indexnew1s_path
  end
end
