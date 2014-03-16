require 'test_helper'

class DeskSubjsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:desk_subjs)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_desk_subj
    assert_difference('DeskSubj.count') do
      post :create, :desk_subj => { }
    end

    assert_redirected_to desk_subj_path(assigns(:desk_subj))
  end

  def test_should_show_desk_subj
    get :show, :id => desk_subjs(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => desk_subjs(:one).id
    assert_response :success
  end

  def test_should_update_desk_subj
    put :update, :id => desk_subjs(:one).id, :desk_subj => { }
    assert_redirected_to desk_subj_path(assigns(:desk_subj))
  end

  def test_should_destroy_desk_subj
    assert_difference('DeskSubj.count', -1) do
      delete :destroy, :id => desk_subjs(:one).id
    end

    assert_redirected_to desk_subjs_path
  end
end
