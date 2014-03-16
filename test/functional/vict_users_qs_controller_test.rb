require 'test_helper'

class VictUsersQsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:vict_users_qs)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_vict_users_q
    assert_difference('VictUsersQ.count') do
      post :create, :vict_users_q => { }
    end

    assert_redirected_to vict_users_q_path(assigns(:vict_users_q))
  end

  def test_should_show_vict_users_q
    get :show, :id => vict_users_qs(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => vict_users_qs(:one).id
    assert_response :success
  end

  def test_should_update_vict_users_q
    put :update, :id => vict_users_qs(:one).id, :vict_users_q => { }
    assert_redirected_to vict_users_q_path(assigns(:vict_users_q))
  end

  def test_should_destroy_vict_users_q
    assert_difference('VictUsersQ.count', -1) do
      delete :destroy, :id => vict_users_qs(:one).id
    end

    assert_redirected_to vict_users_qs_path
  end
end
