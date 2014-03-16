require 'test_helper'

class DeskprofsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:deskprofs)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_deskprof
    assert_difference('Deskprof.count') do
      post :create, :deskprof => { }
    end

    assert_redirected_to deskprof_path(assigns(:deskprof))
  end

  def test_should_show_deskprof
    get :show, :id => deskprofs(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => deskprofs(:one).id
    assert_response :success
  end

  def test_should_update_deskprof
    put :update, :id => deskprofs(:one).id, :deskprof => { }
    assert_redirected_to deskprof_path(assigns(:deskprof))
  end

  def test_should_destroy_deskprof
    assert_difference('Deskprof.count', -1) do
      delete :destroy, :id => deskprofs(:one).id
    end

    assert_redirected_to deskprofs_path
  end
end
