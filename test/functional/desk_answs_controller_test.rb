require 'test_helper'

class DeskAnswsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:desk_answs)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_desk_answ
    assert_difference('DeskAnsw.count') do
      post :create, :desk_answ => { }
    end

    assert_redirected_to desk_answ_path(assigns(:desk_answ))
  end

  def test_should_show_desk_answ
    get :show, :id => desk_answs(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => desk_answs(:one).id
    assert_response :success
  end

  def test_should_update_desk_answ
    put :update, :id => desk_answs(:one).id, :desk_answ => { }
    assert_redirected_to desk_answ_path(assigns(:desk_answ))
  end

  def test_should_destroy_desk_answ
    assert_difference('DeskAnsw.count', -1) do
      delete :destroy, :id => desk_answs(:one).id
    end

    assert_redirected_to desk_answs_path
  end
end
