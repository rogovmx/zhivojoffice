require 'test_helper'

class Raspr1sControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:raspr1s)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_raspr1
    assert_difference('Raspr1.count') do
      post :create, :raspr1 => { }
    end

    assert_redirected_to raspr1_path(assigns(:raspr1))
  end

  def test_should_show_raspr1
    get :show, :id => raspr1s(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => raspr1s(:one).id
    assert_response :success
  end

  def test_should_update_raspr1
    put :update, :id => raspr1s(:one).id, :raspr1 => { }
    assert_redirected_to raspr1_path(assigns(:raspr1))
  end

  def test_should_destroy_raspr1
    assert_difference('Raspr1.count', -1) do
      delete :destroy, :id => raspr1s(:one).id
    end

    assert_redirected_to raspr1s_path
  end
end
