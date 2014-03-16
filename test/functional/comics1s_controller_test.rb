require 'test_helper'

class Comics1sControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:comics1s)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_comics1
    assert_difference('Comics1.count') do
      post :create, :comics1 => { }
    end

    assert_redirected_to comics1_path(assigns(:comics1))
  end

  def test_should_show_comics1
    get :show, :id => comics1s(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => comics1s(:one).id
    assert_response :success
  end

  def test_should_update_comics1
    put :update, :id => comics1s(:one).id, :comics1 => { }
    assert_redirected_to comics1_path(assigns(:comics1))
  end

  def test_should_destroy_comics1
    assert_difference('Comics1.count', -1) do
      delete :destroy, :id => comics1s(:one).id
    end

    assert_redirected_to comics1s_path
  end
end
