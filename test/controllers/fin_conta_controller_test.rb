require 'test_helper'

class FinContaControllerTest < ActionController::TestCase
  setup do
    @fin_contum = fin_conta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fin_conta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fin_contum" do
    assert_difference('FinContum.count') do
      post :create, fin_contum: { agencia: @fin_contum.agencia, banco: @fin_contum.banco, conta: @fin_contum.conta, created_by: @fin_contum.created_by, descricao: @fin_contum.descricao, obs: @fin_contum.obs, saldo: @fin_contum.saldo, status: @fin_contum.status, updated_by: @fin_contum.updated_by }
    end

    assert_redirected_to fin_contum_path(assigns(:fin_contum))
  end

  test "should show fin_contum" do
    get :show, id: @fin_contum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fin_contum
    assert_response :success
  end

  test "should update fin_contum" do
    patch :update, id: @fin_contum, fin_contum: { agencia: @fin_contum.agencia, banco: @fin_contum.banco, conta: @fin_contum.conta, created_by: @fin_contum.created_by, descricao: @fin_contum.descricao, obs: @fin_contum.obs, saldo: @fin_contum.saldo, status: @fin_contum.status, updated_by: @fin_contum.updated_by }
    assert_redirected_to fin_contum_path(assigns(:fin_contum))
  end

  test "should destroy fin_contum" do
    assert_difference('FinContum.count', -1) do
      delete :destroy, id: @fin_contum
    end

    assert_redirected_to fin_conta_path
  end
end
