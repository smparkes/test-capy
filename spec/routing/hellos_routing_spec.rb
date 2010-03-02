require 'spec_helper'

describe HellosController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/hellos" }.should route_to(:controller => "hellos", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/hellos/new" }.should route_to(:controller => "hellos", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/hellos/1" }.should route_to(:controller => "hellos", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/hellos/1/edit" }.should route_to(:controller => "hellos", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/hellos" }.should route_to(:controller => "hellos", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/hellos/1" }.should route_to(:controller => "hellos", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/hellos/1" }.should route_to(:controller => "hellos", :action => "destroy", :id => "1") 
    end
  end
end
