require 'test_helper'

class VacanciesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:vacancies)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_vacancy
    assert_difference('Vacancy.count') do
      post :create, :vacancy => { }
    end

    assert_redirected_to vacancy_path(assigns(:vacancy))
  end

  def test_should_show_vacancy
    get :show, :id => vacancies(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => vacancies(:one).id
    assert_response :success
  end

  def test_should_update_vacancy
    put :update, :id => vacancies(:one).id, :vacancy => { }
    assert_redirected_to vacancy_path(assigns(:vacancy))
  end

  def test_should_destroy_vacancy
    assert_difference('Vacancy.count', -1) do
      delete :destroy, :id => vacancies(:one).id
    end

    assert_redirected_to vacancies_path
  end
end
