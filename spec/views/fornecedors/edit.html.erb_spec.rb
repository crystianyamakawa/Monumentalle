require 'rails_helper'

RSpec.describe "fornecedors/edit", type: :view do
  before(:each) do
    @fornecedor = assign(:fornecedor, Fornecedor.create!(
      :nome => "MyString",
      :nr_telefone => "MyString",
      :nr_telefone2 => "MyString",
      :contato => "MyString",
      :rua => "MyString",
      :nr_endereco => "MyString",
      :bairro => "MyString",
      :cidade => "MyString",
      :cep => "MyString",
      :uf => "MyString",
      :created_by => "MyString",
      :updated_by => "MyString"
    ))
  end

  it "renders the edit fornecedor form" do
    render

    assert_select "form[action=?][method=?]", fornecedor_path(@fornecedor), "post" do

      assert_select "input#fornecedor_nome[name=?]", "fornecedor[nome]"

      assert_select "input#fornecedor_nr_telefone[name=?]", "fornecedor[nr_telefone]"

      assert_select "input#fornecedor_nr_telefone2[name=?]", "fornecedor[nr_telefone2]"

      assert_select "input#fornecedor_contato[name=?]", "fornecedor[contato]"

      assert_select "input#fornecedor_rua[name=?]", "fornecedor[rua]"

      assert_select "input#fornecedor_nr_endereco[name=?]", "fornecedor[nr_endereco]"

      assert_select "input#fornecedor_bairro[name=?]", "fornecedor[bairro]"

      assert_select "input#fornecedor_cidade[name=?]", "fornecedor[cidade]"

      assert_select "input#fornecedor_cep[name=?]", "fornecedor[cep]"

      assert_select "input#fornecedor_uf[name=?]", "fornecedor[uf]"

      assert_select "input#fornecedor_created_by[name=?]", "fornecedor[created_by]"

      assert_select "input#fornecedor_updated_by[name=?]", "fornecedor[updated_by]"
    end
  end
end
