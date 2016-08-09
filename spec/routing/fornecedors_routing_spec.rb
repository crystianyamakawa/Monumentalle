require "rails_helper"

RSpec.describe fornecedorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/fornecedors").to route_to("fornecedors#index")
    end

    it "routes to #new" do
      expect(:get => "/fornecedors/new").to route_to("fornecedors#new")
    end

    it "routes to #show" do
      expect(:get => "/fornecedors/1").to route_to("fornecedors#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/fornecedors/1/edit").to route_to("fornecedors#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/fornecedors").to route_to("fornecedors#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/fornecedors/1").to route_to("fornecedors#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/fornecedors/1").to route_to("fornecedors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/fornecedors/1").to route_to("fornecedors#destroy", :id => "1")
    end

  end
end
