require 'test_helper'

class ClientesControllerTest < ActionController::TestCase
  setup do
    @cliente = clientes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cliente" do
    assert_difference('Cliente.count') do
      post :create, cliente: { bairro: @cliente.bairro, cep: @cliente.cep, cidade: @cliente.cidade, created_by: @cliente.created_by, dt_nascimento: @cliente.dt_nascimento, nome: @cliente.nome, nr_casa: @cliente.nr_casa, nr_cpf_cnpj: @cliente.nr_cpf_cnpj, nr_documento: @cliente.nr_documento, obs: @cliente.obs, rua: @cliente.rua, timestamp: @cliente.timestamp, tp_documento: @cliente.tp_documento, uf: @cliente.uf, updated_by: @cliente.updated_by }
    end

    assert_redirected_to cliente_path(assigns(:cliente))
  end

  test "should show cliente" do
    get :show, id: @cliente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cliente
    assert_response :success
  end

  test "should update cliente" do
    patch :update, id: @cliente, cliente: { bairro: @cliente.bairro, cep: @cliente.cep, cidade: @cliente.cidade, created_by: @cliente.created_by, dt_nascimento: @cliente.dt_nascimento, nome: @cliente.nome, nr_casa: @cliente.nr_casa, nr_cpf_cnpj: @cliente.nr_cpf_cnpj, nr_documento: @cliente.nr_documento, obs: @cliente.obs, rua: @cliente.rua, timestamp: @cliente.timestamp, tp_documento: @cliente.tp_documento, uf: @cliente.uf, updated_by: @cliente.updated_by }
    assert_redirected_to cliente_path(assigns(:cliente))
  end

  test "should destroy cliente" do
    assert_difference('Cliente.count', -1) do
      delete :destroy, id: @cliente
    end

    assert_redirected_to clientes_path
  end
end
