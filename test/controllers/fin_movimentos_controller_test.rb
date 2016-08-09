require 'test_helper'

class FinMovimentosControllerTest < ActionController::TestCase
  setup do
    @fin_movimento = fin_movimentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fin_movimentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fin_movimento" do
    assert_difference('FinMovimento.count') do
      post :create, fin_movimento: { conta_id: @fin_movimento.conta_id, created_by: @fin_movimento.created_by, descricao: @fin_movimento.descricao, dt_executado: @fin_movimento.dt_executado, dt_previsto: @fin_movimento.dt_previsto, motivo_status: @fin_movimento.motivo_status, obs: @fin_movimento.obs, origem_id: @fin_movimento.origem_id, status: @fin_movimento.status, tp_movimento: @fin_movimento.tp_movimento, tp_origem: @fin_movimento.tp_origem, updated_by: @fin_movimento.updated_by, valor: @fin_movimento.valor }
    end

    assert_redirected_to fin_movimento_path(assigns(:fin_movimento))
  end

  test "should show fin_movimento" do
    get :show, id: @fin_movimento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fin_movimento
    assert_response :success
  end

  test "should update fin_movimento" do
    patch :update, id: @fin_movimento, fin_movimento: { conta_id: @fin_movimento.conta_id, created_by: @fin_movimento.created_by, descricao: @fin_movimento.descricao, dt_executado: @fin_movimento.dt_executado, dt_previsto: @fin_movimento.dt_previsto, motivo_status: @fin_movimento.motivo_status, obs: @fin_movimento.obs, origem_id: @fin_movimento.origem_id, status: @fin_movimento.status, tp_movimento: @fin_movimento.tp_movimento, tp_origem: @fin_movimento.tp_origem, updated_by: @fin_movimento.updated_by, valor: @fin_movimento.valor }
    assert_redirected_to fin_movimento_path(assigns(:fin_movimento))
  end

  test "should destroy fin_movimento" do
    assert_difference('FinMovimento.count', -1) do
      delete :destroy, id: @fin_movimento
    end

    assert_redirected_to fin_movimentos_path
  end
end
