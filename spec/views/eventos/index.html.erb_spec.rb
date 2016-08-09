require 'rails_helper'

RSpec.describe "eventos/index", type: :view do
  before(:each) do
    assign(:eventos, [
      Evento.create!(
        :created_by => "Created By",
        :update_by => "Update By",
        :obs => "MyText",
        :tp_evento => "Tp Evento",
        :status => "Status",
        :sinc_google => 1
      ),
      Evento.create!(
        :created_by => "Created By",
        :update_by => "Update By",
        :obs => "MyText",
        :tp_evento => "Tp Evento",
        :status => "Status",
        :sinc_google => 1
      )
    ])
  end

  it "renders a list of eventos" do
    render
    assert_select "tr>td", :text => "Created By".to_s, :count => 2
    assert_select "tr>td", :text => "Update By".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Tp Evento".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
