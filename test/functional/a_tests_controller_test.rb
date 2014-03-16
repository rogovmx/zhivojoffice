require 'test_helper'

class ATestsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:a_tests)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_a_test
    assert_difference('ATest.count') do
      post :create, :a_test => { }
    end

    assert_redirected_to a_test_path(assigns(:a_test))
  end

  def test_should_show_a_test
    get :show, :id => a_tests(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => a_tests(:one).id
    assert_response :success
  end

  def test_should_update_a_test
    put :update, :id => a_tests(:one).id, :a_test => { }
    assert_redirected_to a_test_path(assigns(:a_test))
  end

  def test_should_destroy_a_test
    assert_difference('ATest.count', -1) do
      delete :destroy, :id => a_tests(:one).id
    end

    assert_redirected_to a_tests_path
  end
end
