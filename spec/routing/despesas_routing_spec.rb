require "rails_helper"

RSpec.describe DespesasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/despesas").to route_to("despesas#index")
    end

    it "routes to #new" do
      expect(:get => "/despesas/new").to route_to("despesas#new")
    end

    it "routes to #show" do
      expect(:get => "/despesas/1").to route_to("despesas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/despesas/1/edit").to route_to("despesas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/despesas").to route_to("despesas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/despesas/1").to route_to("despesas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/despesas/1").to route_to("despesas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/despesas/1").to route_to("despesas#destroy", :id => "1")
    end

  end
end
