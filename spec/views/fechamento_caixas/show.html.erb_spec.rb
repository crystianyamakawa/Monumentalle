require 'rails_helper'

RSpec.describe "fechamento_caixas/show", type: :view do
  before(:each) do
    @fechamento_caixa = assign(:fechamento_caixa, FechamentoCaixa.create!(
      :fin_conta_id => 1,
      :vl_saldo => 1.5,
      :created_by => "Created By",
      :updated_by => "Updated By"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Created By/)
    expect(rendered).to match(/Updated By/)
  end
end
