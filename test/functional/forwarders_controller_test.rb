require 'test_helper'

class ForwardersControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:forwarders)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_forwarder
    assert_difference('Forwarder.count') do
      post :create, :forwarder => { }
    end

    assert_redirected_to forwarder_path(assigns(:forwarder))
  end

  def test_should_show_forwarder
    get :show, :id => forwarders(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => forwarders(:one).id
    assert_response :success
  end

  def test_should_update_forwarder
    put :update, :id => forwarders(:one).id, :forwarder => { }
    assert_redirected_to forwarder_path(assigns(:forwarder))
  end

  def test_should_destroy_forwarder
    assert_difference('Forwarder.count', -1) do
      delete :destroy, :id => forwarders(:one).id
    end

    assert_redirected_to forwarders_path
  end
end
