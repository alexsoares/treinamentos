require 'test_helper'

class PesquisasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pesquisas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pesquisa" do
    assert_difference('Pesquisa.count') do
      post :create, :pesquisa => { }
    end

    assert_redirected_to pesquisa_path(assigns(:pesquisa))
  end

  test "should show pesquisa" do
    get :show, :id => pesquisas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => pesquisas(:one).to_param
    assert_response :success
  end

  test "should update pesquisa" do
    put :update, :id => pesquisas(:one).to_param, :pesquisa => { }
    assert_redirected_to pesquisa_path(assigns(:pesquisa))
  end

  test "should destroy pesquisa" do
    assert_difference('Pesquisa.count', -1) do
      delete :destroy, :id => pesquisas(:one).to_param
    end

    assert_redirected_to pesquisas_path
  end
end
