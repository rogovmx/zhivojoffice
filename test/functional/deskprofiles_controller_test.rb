require 'test_helper'

class DeskprofilesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:deskprofiles)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_deskprofile
    assert_difference('Deskprofile.count') do
      post :create, :deskprofile => { }
    end

    assert_redirected_to deskprofile_path(assigns(:deskprofile))
  end

  def test_should_show_deskprofile
    get :show, :id => deskprofiles(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => deskprofiles(:one).id
    assert_response :success
  end

  def test_should_update_deskprofile
    put :update, :id => deskprofiles(:one).id, :deskprofile => { }
    assert_redirected_to deskprofile_path(assigns(:deskprofile))
  end

  def test_should_destroy_deskprofile
    assert_difference('Deskprofile.count', -1) do
      delete :destroy, :id => deskprofiles(:one).id
    end

    assert_redirected_to deskprofiles_path
  end
end
