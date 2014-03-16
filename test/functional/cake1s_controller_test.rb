require 'test_helper'

class Cake1sControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:cake1s)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_cake1
    assert_difference('Cake1.count') do
      post :create, :cake1 => { }
    end

    assert_redirected_to cake1_path(assigns(:cake1))
  end

  def test_should_show_cake1
    get :show, :id => cake1s(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => cake1s(:one).id
    assert_response :success
  end

  def test_should_update_cake1
    put :update, :id => cake1s(:one).id, :cake1 => { }
    assert_redirected_to cake1_path(assigns(:cake1))
  end

  def test_should_destroy_cake1
    assert_difference('Cake1.count', -1) do
      delete :destroy, :id => cake1s(:one).id
    end

    assert_redirected_to cake1s_path
  end
end
