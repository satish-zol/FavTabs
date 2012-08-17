require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe TabsController do

  # This should return the minimal set of attributes required to create a valid
  # Tab. As you add validations to Tab, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all tabs as @tabs" do
      tab = Tab.create! valid_attributes
      get :index
      assigns(:tabs).should eq([tab])
    end
  end

  describe "GET show" do
    it "assigns the requested tab as @tab" do
      tab = Tab.create! valid_attributes
      get :show, :id => tab.id
      assigns(:tab).should eq(tab)
    end
  end

  describe "GET new" do
    it "assigns a new tab as @tab" do
      get :new
      assigns(:tab).should be_a_new(Tab)
    end
  end

  describe "GET edit" do
    it "assigns the requested tab as @tab" do
      tab = Tab.create! valid_attributes
      get :edit, :id => tab.id
      assigns(:tab).should eq(tab)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Tab" do
        expect {
          post :create, :tab => valid_attributes
        }.to change(Tab, :count).by(1)
      end

      it "assigns a newly created tab as @tab" do
        post :create, :tab => valid_attributes
        assigns(:tab).should be_a(Tab)
        assigns(:tab).should be_persisted
      end

      it "redirects to the created tab" do
        post :create, :tab => valid_attributes
        response.should redirect_to(Tab.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved tab as @tab" do
        # Trigger the behavior that occurs when invalid params are submitted
        Tab.any_instance.stub(:save).and_return(false)
        post :create, :tab => {}
        assigns(:tab).should be_a_new(Tab)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Tab.any_instance.stub(:save).and_return(false)
        post :create, :tab => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested tab" do
        tab = Tab.create! valid_attributes
        # Assuming there are no other tabs in the database, this
        # specifies that the Tab created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Tab.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => tab.id, :tab => {'these' => 'params'}
      end

      it "assigns the requested tab as @tab" do
        tab = Tab.create! valid_attributes
        put :update, :id => tab.id, :tab => valid_attributes
        assigns(:tab).should eq(tab)
      end

      it "redirects to the tab" do
        tab = Tab.create! valid_attributes
        put :update, :id => tab.id, :tab => valid_attributes
        response.should redirect_to(tab)
      end
    end

    describe "with invalid params" do
      it "assigns the tab as @tab" do
        tab = Tab.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Tab.any_instance.stub(:save).and_return(false)
        put :update, :id => tab.id, :tab => {}
        assigns(:tab).should eq(tab)
      end

      it "re-renders the 'edit' template" do
        tab = Tab.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Tab.any_instance.stub(:save).and_return(false)
        put :update, :id => tab.id, :tab => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested tab" do
      tab = Tab.create! valid_attributes
      expect {
        delete :destroy, :id => tab.id
      }.to change(Tab, :count).by(-1)
    end

    it "redirects to the tabs list" do
      tab = Tab.create! valid_attributes
      delete :destroy, :id => tab.id
      response.should redirect_to(tabs_url)
    end
  end

end
