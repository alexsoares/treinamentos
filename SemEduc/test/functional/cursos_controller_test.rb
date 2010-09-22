require 'test_helper'

class CursosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cursos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create curso" do
    assert_difference('Curso.count') do
      post :create, :curso => { }
    end

    assert_redirected_to curso_path(assigns(:curso))
  end

  test "should show curso" do
    get :show, :id => cursos(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cursos(:one).id
    assert_response :success
  end

  test "should update curso" do
    put :update, :id => cursos(:one).id, :curso => { }
    assert_redirected_to curso_path(assigns(:curso))
  end

  test "should destroy curso" do
    assert_difference('Curso.count', -1) do
      delete :destroy, :id => cursos(:one).id
    end

    assert_redirected_to cursos_path
  end
end
