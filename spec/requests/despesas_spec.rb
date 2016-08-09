require 'rails_helper'

RSpec.describe "Despesas", type: :request do
  describe "GET /despesas" do
    it "works! (now write some real specs)" do
      get despesas_path
      expect(response).to have_http_status(200)
    end
  end
end
