require 'test_helper'

class NeedsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:needs)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_need
    assert_difference('Need.count') do
      post :create, :need => { }
    end

    assert_redirected_to need_path(assigns(:need))
  end

  def test_should_show_need
    get :show, :id => needs(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => needs(:one).id
    assert_response :success
  end

  def test_should_update_need
    put :update, :id => needs(:one).id, :need => { }
    assert_redirected_to need_path(assigns(:need))
  end

  def test_should_destroy_need
    assert_difference('Need.count', -1) do
      delete :destroy, :id => needs(:one).id
    end

    assert_redirected_to needs_path
  end
end
