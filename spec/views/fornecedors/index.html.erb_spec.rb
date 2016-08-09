require 'rails_helper'

RSpec.describe "fornecedors/index", type: :view do
  before(:each) do
    assign(:fornecedors, [
      Fornecedor.create!(
        :nome => "Nome",
        :nr_telefone => "Nr Telefone",
        :nr_telefone2 => "Nr Telefone2",
        :contato => "Contato",
        :rua => "Rua",
        :nr_endereco => "Nr Endereco",
        :bairro => "Bairro",
        :cidade => "Cidade",
        :cep => "Cep",
        :uf => "Uf",
        :created_by => "Created By",
        :updated_by => "Updated By"
      ),
      Fornecedor.create!(
        :nome => "Nome",
        :nr_telefone => "Nr Telefone",
        :nr_telefone2 => "Nr Telefone2",
        :contato => "Contato",
        :rua => "Rua",
        :nr_endereco => "Nr Endereco",
        :bairro => "Bairro",
        :cidade => "Cidade",
        :cep => "Cep",
        :uf => "Uf",
        :created_by => "Created By",
        :updated_by => "Updated By"
      )
    ])
  end

  it "renders a list of fornecedors" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Nr Telefone".to_s, :count => 2
    assert_select "tr>td", :text => "Nr Telefone2".to_s, :count => 2
    assert_select "tr>td", :text => "Contato".to_s, :count => 2
    assert_select "tr>td", :text => "Rua".to_s, :count => 2
    assert_select "tr>td", :text => "Nr Endereco".to_s, :count => 2
    assert_select "tr>td", :text => "Bairro".to_s, :count => 2
    assert_select "tr>td", :text => "Cidade".to_s, :count => 2
    assert_select "tr>td", :text => "Cep".to_s, :count => 2
    assert_select "tr>td", :text => "Uf".to_s, :count => 2
    assert_select "tr>td", :text => "Created By".to_s, :count => 2
    assert_select "tr>td", :text => "Updated By".to_s, :count => 2
  end
end
