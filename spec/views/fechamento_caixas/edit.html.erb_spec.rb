require 'rails_helper'

RSpec.describe "fechamento_caixas/edit", type: :view do
  before(:each) do
    @fechamento_caixa = assign(:fechamento_caixa, FechamentoCaixa.create!(
      :fin_conta_id => 1,
      :vl_saldo => 1.5,
      :created_by => "MyString",
      :updated_by => "MyString"
    ))
  end

  it "renders the edit fechamento_caixa form" do
    render

    assert_select "form[action=?][method=?]", fechamento_caixa_path(@fechamento_caixa), "post" do

      assert_select "input#fechamento_caixa_fin_conta_id[name=?]", "fechamento_caixa[fin_conta_id]"

      assert_select "input#fechamento_caixa_vl_saldo[name=?]", "fechamento_caixa[vl_saldo]"

      assert_select "input#fechamento_caixa_created_by[name=?]", "fechamento_caixa[created_by]"

      assert_select "input#fechamento_caixa_updated_by[name=?]", "fechamento_caixa[updated_by]"
    end
  end
end
