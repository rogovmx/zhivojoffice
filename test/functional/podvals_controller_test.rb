require 'test_helper'

class PodvalsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:podvals)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_podval
    assert_difference('Podval.count') do
      post :create, :podval => { }
    end

    assert_redirected_to podval_path(assigns(:podval))
  end

  def test_should_show_podval
    get :show, :id => podvals(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => podvals(:one).id
    assert_response :success
  end

  def test_should_update_podval
    put :update, :id => podvals(:one).id, :podval => { }
    assert_redirected_to podval_path(assigns(:podval))
  end

  def test_should_destroy_podval
    assert_difference('Podval.count', -1) do
      delete :destroy, :id => podvals(:one).id
    end

    assert_redirected_to podvals_path
  end
end
