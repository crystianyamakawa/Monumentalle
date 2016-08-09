require "rails_helper"

RSpec.describe FechamentoCaixasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/fechamento_caixas").to route_to("fechamento_caixas#index")
    end

    it "routes to #new" do
      expect(:get => "/fechamento_caixas/new").to route_to("fechamento_caixas#new")
    end

    it "routes to #show" do
      expect(:get => "/fechamento_caixas/1").to route_to("fechamento_caixas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/fechamento_caixas/1/edit").to route_to("fechamento_caixas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/fechamento_caixas").to route_to("fechamento_caixas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/fechamento_caixas/1").to route_to("fechamento_caixas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/fechamento_caixas/1").to route_to("fechamento_caixas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/fechamento_caixas/1").to route_to("fechamento_caixas#destroy", :id => "1")
    end

  end
end
