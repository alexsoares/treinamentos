require 'test_helper'

class InscricaosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inscricaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inscricao" do
    assert_difference('Inscricao.count') do
      post :create, :inscricao => { }
    end

    assert_redirected_to inscricao_path(assigns(:inscricao))
  end

  test "should show inscricao" do
    get :show, :id => inscricaos(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => inscricaos(:one).id
    assert_response :success
  end

  test "should update inscricao" do
    put :update, :id => inscricaos(:one).id, :inscricao => { }
    assert_redirected_to inscricao_path(assigns(:inscricao))
  end

  test "should destroy inscricao" do
    assert_difference('Inscricao.count', -1) do
      delete :destroy, :id => inscricaos(:one).id
    end

    assert_redirected_to inscricaos_path
  end
end
