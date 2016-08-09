require 'rails_helper'

RSpec.describe "eventos/new", type: :view do
  before(:each) do
    assign(:evento, Evento.new(
      :created_by => "MyString",
      :update_by => "MyString",
      :obs => "MyText",
      :tp_evento => "MyString",
      :status => "MyString",
      :sinc_google => 1
    ))
  end

  it "renders new evento form" do
    render

    assert_select "form[action=?][method=?]", eventos_path, "post" do

      assert_select "input#evento_created_by[name=?]", "evento[created_by]"

      assert_select "input#evento_update_by[name=?]", "evento[update_by]"

      assert_select "textarea#evento_obs[name=?]", "evento[obs]"

      assert_select "input#evento_tp_evento[name=?]", "evento[tp_evento]"

      assert_select "input#evento_status[name=?]", "evento[status]"

      assert_select "input#evento_sinc_google[name=?]", "evento[sinc_google]"
    end
  end
end
