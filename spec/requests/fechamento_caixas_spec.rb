require 'rails_helper'

RSpec.describe "FechamentoCaixas", type: :request do
  describe "GET /fechamento_caixas" do
    it "works! (now write some real specs)" do
      get fechamento_caixas_path
      expect(response).to have_http_status(200)
    end
  end
end
