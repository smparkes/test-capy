require 'spec_helper'

describe HellosController do

  def mock_hello(stubs={})
    @mock_hello ||= mock_model(Hello, stubs)
  end

  describe "GET index" do
    it "assigns all hellos as @hellos" do
      Hello.stub(:find).with(:all).and_return([mock_hello])
      get :index
      assigns[:hellos].should == [mock_hello]
    end
  end

  describe "GET show" do
    it "assigns the requested hello as @hello" do
      Hello.stub(:find).with("37").and_return(mock_hello)
      get :show, :id => "37"
      assigns[:hello].should equal(mock_hello)
    end
  end

  describe "GET new" do
    it "assigns a new hello as @hello" do
      Hello.stub(:new).and_return(mock_hello)
      get :new
      assigns[:hello].should equal(mock_hello)
    end
  end

  describe "GET edit" do
    it "assigns the requested hello as @hello" do
      Hello.stub(:find).with("37").and_return(mock_hello)
      get :edit, :id => "37"
      assigns[:hello].should equal(mock_hello)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created hello as @hello" do
        Hello.stub(:new).with({'these' => 'params'}).and_return(mock_hello(:save => true))
        post :create, :hello => {:these => 'params'}
        assigns[:hello].should equal(mock_hello)
      end

      it "redirects to the created hello" do
        Hello.stub(:new).and_return(mock_hello(:save => true))
        post :create, :hello => {}
        response.should redirect_to(hello_url(mock_hello))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved hello as @hello" do
        Hello.stub(:new).with({'these' => 'params'}).and_return(mock_hello(:save => false))
        post :create, :hello => {:these => 'params'}
        assigns[:hello].should equal(mock_hello)
      end

      it "re-renders the 'new' template" do
        Hello.stub(:new).and_return(mock_hello(:save => false))
        post :create, :hello => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested hello" do
        Hello.should_receive(:find).with("37").and_return(mock_hello)
        mock_hello.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :hello => {:these => 'params'}
      end

      it "assigns the requested hello as @hello" do
        Hello.stub(:find).and_return(mock_hello(:update_attributes => true))
        put :update, :id => "1"
        assigns[:hello].should equal(mock_hello)
      end

      it "redirects to the hello" do
        Hello.stub(:find).and_return(mock_hello(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(hello_url(mock_hello))
      end
    end

    describe "with invalid params" do
      it "updates the requested hello" do
        Hello.should_receive(:find).with("37").and_return(mock_hello)
        mock_hello.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :hello => {:these => 'params'}
      end

      it "assigns the hello as @hello" do
        Hello.stub(:find).and_return(mock_hello(:update_attributes => false))
        put :update, :id => "1"
        assigns[:hello].should equal(mock_hello)
      end

      it "re-renders the 'edit' template" do
        Hello.stub(:find).and_return(mock_hello(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested hello" do
      Hello.should_receive(:find).with("37").and_return(mock_hello)
      mock_hello.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the hellos list" do
      Hello.stub(:find).and_return(mock_hello(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(hellos_url)
    end
  end

end
