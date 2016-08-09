require 'rails_helper'

RSpec.describe "despesas/edit", type: :view do
  before(:each) do
    @despesa = assign(:despesa, Despesa.create!(
      :nome => "MyString",
      :fornecedor_id => 1,
      :vl_despesa => 1.5,
      :status => "MyString",
      :obs => "MyText",
      :created_by => "MyString",
      :updated_by => "MyString"
    ))
  end

  it "renders the edit despesa form" do
    render

    assert_select "form[action=?][method=?]", despesa_path(@despesa), "post" do

      assert_select "input#despesa_nome[name=?]", "despesa[nome]"

      assert_select "input#despesa_fornecedor_id[name=?]", "despesa[fornecedor_id]"

      assert_select "input#despesa_vl_despesa[name=?]", "despesa[vl_despesa]"

      assert_select "input#despesa_status[name=?]", "despesa[status]"

      assert_select "textarea#despesa_obs[name=?]", "despesa[obs]"

      assert_select "input#despesa_created_by[name=?]", "despesa[created_by]"

      assert_select "input#despesa_updated_by[name=?]", "despesa[updated_by]"
    end
  end
end
