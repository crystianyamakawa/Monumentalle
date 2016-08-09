require 'rails_helper'

RSpec.describe "fornecedors/show", type: :view do
  before(:each) do
    @fornecedor = assign(:fornecedor, Fornecedor.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Nr Telefone/)
    expect(rendered).to match(/Nr Telefone2/)
    expect(rendered).to match(/Contato/)
    expect(rendered).to match(/Rua/)
    expect(rendered).to match(/Nr Endereco/)
    expect(rendered).to match(/Bairro/)
    expect(rendered).to match(/Cidade/)
    expect(rendered).to match(/Cep/)
    expect(rendered).to match(/Uf/)
    expect(rendered).to match(/Created By/)
    expect(rendered).to match(/Updated By/)
  end
end
