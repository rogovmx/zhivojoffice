require 'test_helper'

class VictorinasControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:victorinas)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_victorina
    assert_difference('Victorina.count') do
      post :create, :victorina => { }
    end

    assert_redirected_to victorina_path(assigns(:victorina))
  end

  def test_should_show_victorina
    get :show, :id => victorinas(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => victorinas(:one).id
    assert_response :success
  end

  def test_should_update_victorina
    put :update, :id => victorinas(:one).id, :victorina => { }
    assert_redirected_to victorina_path(assigns(:victorina))
  end

  def test_should_destroy_victorina
    assert_difference('Victorina.count', -1) do
      delete :destroy, :id => victorinas(:one).id
    end

    assert_redirected_to victorinas_path
  end
end
