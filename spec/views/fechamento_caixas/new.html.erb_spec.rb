require 'rails_helper'

RSpec.describe "fechamento_caixas/new", type: :view do
  before(:each) do
    assign(:fechamento_caixa, FechamentoCaixa.new(
      :fin_conta_id => 1,
      :vl_saldo => 1.5,
      :created_by => "MyString",
      :updated_by => "MyString"
    ))
  end

  it "renders new fechamento_caixa form" do
    render

    assert_select "form[action=?][method=?]", fechamento_caixas_path, "post" do

      assert_select "input#fechamento_caixa_fin_conta_id[name=?]", "fechamento_caixa[fin_conta_id]"

      assert_select "input#fechamento_caixa_vl_saldo[name=?]", "fechamento_caixa[vl_saldo]"

      assert_select "input#fechamento_caixa_created_by[name=?]", "fechamento_caixa[created_by]"

      assert_select "input#fechamento_caixa_updated_by[name=?]", "fechamento_caixa[updated_by]"
    end
  end
end
