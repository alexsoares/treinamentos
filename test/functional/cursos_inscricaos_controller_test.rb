require 'test_helper'

class CursosInscricaosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cursos_inscricaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cursos_inscricao" do
    assert_difference('CursosInscricao.count') do
      post :create, :cursos_inscricao => { }
    end

    assert_redirected_to cursos_inscricao_path(assigns(:cursos_inscricao))
  end

  test "should show cursos_inscricao" do
    get :show, :id => cursos_inscricaos(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cursos_inscricaos(:one).id
    assert_response :success
  end

  test "should update cursos_inscricao" do
    put :update, :id => cursos_inscricaos(:one).id, :cursos_inscricao => { }
    assert_redirected_to cursos_inscricao_path(assigns(:cursos_inscricao))
  end

  test "should destroy cursos_inscricao" do
    assert_difference('CursosInscricao.count', -1) do
      delete :destroy, :id => cursos_inscricaos(:one).id
    end

    assert_redirected_to cursos_inscricaos_path
  end
end
