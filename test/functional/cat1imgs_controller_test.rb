require 'test_helper'

class Cat1imgsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:cat1imgs)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_cat1img
    assert_difference('Cat1img.count') do
      post :create, :cat1img => { }
    end

    assert_redirected_to cat1img_path(assigns(:cat1img))
  end

  def test_should_show_cat1img
    get :show, :id => cat1imgs(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => cat1imgs(:one).id
    assert_response :success
  end

  def test_should_update_cat1img
    put :update, :id => cat1imgs(:one).id, :cat1img => { }
    assert_redirected_to cat1img_path(assigns(:cat1img))
  end

  def test_should_destroy_cat1img
    assert_difference('Cat1img.count', -1) do
      delete :destroy, :id => cat1imgs(:one).id
    end

    assert_redirected_to cat1imgs_path
  end
end
