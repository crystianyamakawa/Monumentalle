require 'rails_helper'

RSpec.describe "fechamento_caixas/index", type: :view do
  before(:each) do
    assign(:fechamento_caixas, [
      FechamentoCaixa.create!(
        :fin_conta_id => 1,
        :vl_saldo => 1.5,
        :created_by => "Created By",
        :updated_by => "Updated By"
      ),
      FechamentoCaixa.create!(
        :fin_conta_id => 1,
        :vl_saldo => 1.5,
        :created_by => "Created By",
        :updated_by => "Updated By"
      )
    ])
  end

  it "renders a list of fechamento_caixas" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Created By".to_s, :count => 2
    assert_select "tr>td", :text => "Updated By".to_s, :count => 2
  end
end
