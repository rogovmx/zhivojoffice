require 'test_helper'

class Vote1sControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:vote1s)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_vote1
    assert_difference('Vote1.count') do
      post :create, :vote1 => { }
    end

    assert_redirected_to vote1_path(assigns(:vote1))
  end

  def test_should_show_vote1
    get :show, :id => vote1s(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => vote1s(:one).id
    assert_response :success
  end

  def test_should_update_vote1
    put :update, :id => vote1s(:one).id, :vote1 => { }
    assert_redirected_to vote1_path(assigns(:vote1))
  end

  def test_should_destroy_vote1
    assert_difference('Vote1.count', -1) do
      delete :destroy, :id => vote1s(:one).id
    end

    assert_redirected_to vote1s_path
  end
end
