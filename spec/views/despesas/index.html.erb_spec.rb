require 'rails_helper'

RSpec.describe "despesas/index", type: :view do
  before(:each) do
    assign(:despesas, [
      Despesa.create!(
        :nome => "Nome",
        :fornecedor_id => 1,
        :vl_despesa => 1.5,
        :status => "Status",
        :obs => "MyText",
        :created_by => "Created By",
        :updated_by => "Updated By"
      ),
      Despesa.create!(
        :nome => "Nome",
        :fornecedor_id => 1,
        :vl_despesa => 1.5,
        :status => "Status",
        :obs => "MyText",
        :created_by => "Created By",
        :updated_by => "Updated By"
      )
    ])
  end

  it "renders a list of despesas" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Created By".to_s, :count => 2
    assert_select "tr>td", :text => "Updated By".to_s, :count => 2
  end
end
