require 'rails_helper'

RSpec.describe "fornecedors", type: :request do
  describe "GET /fornecedors" do
    it "works! (now write some real specs)" do
      get fornecedors_path
      expect(response).to have_http_status(200)
    end
  end
end
