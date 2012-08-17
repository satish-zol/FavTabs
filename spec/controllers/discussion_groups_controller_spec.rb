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

describe DiscussionGroupsController do

  # This should return the minimal set of attributes required to create a valid
  # DiscussionGroup. As you add validations to DiscussionGroup, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all discussion_groups as @discussion_groups" do
      discussion_group = DiscussionGroup.create! valid_attributes
      get :index
      assigns(:discussion_groups).should eq([discussion_group])
    end
  end

  describe "GET show" do
    it "assigns the requested discussion_group as @discussion_group" do
      discussion_group = DiscussionGroup.create! valid_attributes
      get :show, :id => discussion_group.id
      assigns(:discussion_group).should eq(discussion_group)
    end
  end

  describe "GET new" do
    it "assigns a new discussion_group as @discussion_group" do
      get :new
      assigns(:discussion_group).should be_a_new(DiscussionGroup)
    end
  end

  describe "GET edit" do
    it "assigns the requested discussion_group as @discussion_group" do
      discussion_group = DiscussionGroup.create! valid_attributes
      get :edit, :id => discussion_group.id
      assigns(:discussion_group).should eq(discussion_group)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new DiscussionGroup" do
        expect {
          post :create, :discussion_group => valid_attributes
        }.to change(DiscussionGroup, :count).by(1)
      end

      it "assigns a newly created discussion_group as @discussion_group" do
        post :create, :discussion_group => valid_attributes
        assigns(:discussion_group).should be_a(DiscussionGroup)
        assigns(:discussion_group).should be_persisted
      end

      it "redirects to the created discussion_group" do
        post :create, :discussion_group => valid_attributes
        response.should redirect_to(DiscussionGroup.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved discussion_group as @discussion_group" do
        # Trigger the behavior that occurs when invalid params are submitted
        DiscussionGroup.any_instance.stub(:save).and_return(false)
        post :create, :discussion_group => {}
        assigns(:discussion_group).should be_a_new(DiscussionGroup)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        DiscussionGroup.any_instance.stub(:save).and_return(false)
        post :create, :discussion_group => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested discussion_group" do
        discussion_group = DiscussionGroup.create! valid_attributes
        # Assuming there are no other discussion_groups in the database, this
        # specifies that the DiscussionGroup created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        DiscussionGroup.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => discussion_group.id, :discussion_group => {'these' => 'params'}
      end

      it "assigns the requested discussion_group as @discussion_group" do
        discussion_group = DiscussionGroup.create! valid_attributes
        put :update, :id => discussion_group.id, :discussion_group => valid_attributes
        assigns(:discussion_group).should eq(discussion_group)
      end

      it "redirects to the discussion_group" do
        discussion_group = DiscussionGroup.create! valid_attributes
        put :update, :id => discussion_group.id, :discussion_group => valid_attributes
        response.should redirect_to(discussion_group)
      end
    end

    describe "with invalid params" do
      it "assigns the discussion_group as @discussion_group" do
        discussion_group = DiscussionGroup.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        DiscussionGroup.any_instance.stub(:save).and_return(false)
        put :update, :id => discussion_group.id, :discussion_group => {}
        assigns(:discussion_group).should eq(discussion_group)
      end

      it "re-renders the 'edit' template" do
        discussion_group = DiscussionGroup.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        DiscussionGroup.any_instance.stub(:save).and_return(false)
        put :update, :id => discussion_group.id, :discussion_group => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested discussion_group" do
      discussion_group = DiscussionGroup.create! valid_attributes
      expect {
        delete :destroy, :id => discussion_group.id
      }.to change(DiscussionGroup, :count).by(-1)
    end

    it "redirects to the discussion_groups list" do
      discussion_group = DiscussionGroup.create! valid_attributes
      delete :destroy, :id => discussion_group.id
      response.should redirect_to(discussion_groups_url)
    end
  end

end