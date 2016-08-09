require 'rails_helper'

RSpec.describe "eventos/show", type: :view do
  before(:each) do
    @evento = assign(:evento, Evento.create!(
      :created_by => "Created By",
      :update_by => "Update By",
      :obs => "MyText",
      :tp_evento => "Tp Evento",
      :status => "Status",
      :sinc_google => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Created By/)
    expect(rendered).to match(/Update By/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Tp Evento/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/1/)
  end
end
