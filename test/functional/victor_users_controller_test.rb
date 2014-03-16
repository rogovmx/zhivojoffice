require 'test_helper'

class VictorUsersControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:victor_users)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_victor_users
    assert_difference('VictorUsers.count') do
      post :create, :victor_users => { }
    end

    assert_redirected_to victor_users_path(assigns(:victor_users))
  end

  def test_should_show_victor_users
    get :show, :id => victor_users(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => victor_users(:one).id
    assert_response :success
  end

  def test_should_update_victor_users
    put :update, :id => victor_users(:one).id, :victor_users => { }
    assert_redirected_to victor_users_path(assigns(:victor_users))
  end

  def test_should_destroy_victor_users
    assert_difference('VictorUsers.count', -1) do
      delete :destroy, :id => victor_users(:one).id
    end

    assert_redirected_to victor_users_path
  end
end
