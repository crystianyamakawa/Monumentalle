require 'test_helper'

class ContratoProdutosControllerTest < ActionController::TestCase
  setup do
    @contrato_produto = contrato_produtos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contrato_produtos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contrato_produto" do
    assert_difference('ContratoProduto.count') do
      post :create, contrato_produto: { contrato_id: @contrato_produto.contrato_id, created_by: @contrato_produto.created_by, produto_id: @contrato_produto.produto_id, quantidade: @contrato_produto.quantidade, updated_by: @contrato_produto.updated_by, valor: @contrato_produto.valor, vl_negociado: @contrato_produto.vl_negociado }
    end

    assert_redirected_to contrato_produto_path(assigns(:contrato_produto))
  end

  test "should show contrato_produto" do
    get :show, id: @contrato_produto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contrato_produto
    assert_response :success
  end

  test "should update contrato_produto" do
    patch :update, id: @contrato_produto, contrato_produto: { contrato_id: @contrato_produto.contrato_id, created_by: @contrato_produto.created_by, produto_id: @contrato_produto.produto_id, quantidade: @contrato_produto.quantidade, updated_by: @contrato_produto.updated_by, valor: @contrato_produto.valor, vl_negociado: @contrato_produto.vl_negociado }
    assert_redirected_to contrato_produto_path(assigns(:contrato_produto))
  end

  test "should destroy contrato_produto" do
    assert_difference('ContratoProduto.count', -1) do
      delete :destroy, id: @contrato_produto
    end

    assert_redirected_to contrato_produtos_path
  end
end
