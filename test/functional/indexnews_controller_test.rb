require 'test_helper'

class IndexnewsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:indexnews)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_indexnew
    assert_difference('Indexnew.count') do
      post :create, :indexnew => { }
    end

    assert_redirected_to indexnew_path(assigns(:indexnew))
  end

  def test_should_show_indexnew
    get :show, :id => indexnews(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => indexnews(:one).id
    assert_response :success
  end

  def test_should_update_indexnew
    put :update, :id => indexnews(:one).id, :indexnew => { }
    assert_redirected_to indexnew_path(assigns(:indexnew))
  end

  def test_should_destroy_indexnew
    assert_difference('Indexnew.count', -1) do
      delete :destroy, :id => indexnews(:one).id
    end

    assert_redirected_to indexnews_path
  end
end
