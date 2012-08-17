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

describe UserDetailsController do

  # This should return the minimal set of attributes required to create a valid
  # UserDetail. As you add validations to UserDetail, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all user_details as @user_details" do
      user_detail = UserDetail.create! valid_attributes
      get :index
      assigns(:user_details).should eq([user_detail])
    end
  end

  describe "GET show" do
    it "assigns the requested user_detail as @user_detail" do
      user_detail = UserDetail.create! valid_attributes
      get :show, :id => user_detail.id
      assigns(:user_detail).should eq(user_detail)
    end
  end

  describe "GET new" do
    it "assigns a new user_detail as @user_detail" do
      get :new
      assigns(:user_detail).should be_a_new(UserDetail)
    end
  end

  describe "GET edit" do
    it "assigns the requested user_detail as @user_detail" do
      user_detail = UserDetail.create! valid_attributes
      get :edit, :id => user_detail.id
      assigns(:user_detail).should eq(user_detail)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new UserDetail" do
        expect {
          post :create, :user_detail => valid_attributes
        }.to change(UserDetail, :count).by(1)
      end

      it "assigns a newly created user_detail as @user_detail" do
        post :create, :user_detail => valid_attributes
        assigns(:user_detail).should be_a(UserDetail)
        assigns(:user_detail).should be_persisted
      end

      it "redirects to the created user_detail" do
        post :create, :user_detail => valid_attributes
        response.should redirect_to(UserDetail.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user_detail as @user_detail" do
        # Trigger the behavior that occurs when invalid params are submitted
        UserDetail.any_instance.stub(:save).and_return(false)
        post :create, :user_detail => {}
        assigns(:user_detail).should be_a_new(UserDetail)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        UserDetail.any_instance.stub(:save).and_return(false)
        post :create, :user_detail => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user_detail" do
        user_detail = UserDetail.create! valid_attributes
        # Assuming there are no other user_details in the database, this
        # specifies that the UserDetail created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        UserDetail.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => user_detail.id, :user_detail => {'these' => 'params'}
      end

      it "assigns the requested user_detail as @user_detail" do
        user_detail = UserDetail.create! valid_attributes
        put :update, :id => user_detail.id, :user_detail => valid_attributes
        assigns(:user_detail).should eq(user_detail)
      end

      it "redirects to the user_detail" do
        user_detail = UserDetail.create! valid_attributes
        put :update, :id => user_detail.id, :user_detail => valid_attributes
        response.should redirect_to(user_detail)
      end
    end

    describe "with invalid params" do
      it "assigns the user_detail as @user_detail" do
        user_detail = UserDetail.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        UserDetail.any_instance.stub(:save).and_return(false)
        put :update, :id => user_detail.id, :user_detail => {}
        assigns(:user_detail).should eq(user_detail)
      end

      it "re-renders the 'edit' template" do
        user_detail = UserDetail.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        UserDetail.any_instance.stub(:save).and_return(false)
        put :update, :id => user_detail.id, :user_detail => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested user_detail" do
      user_detail = UserDetail.create! valid_attributes
      expect {
        delete :destroy, :id => user_detail.id
      }.to change(UserDetail, :count).by(-1)
    end

    it "redirects to the user_details list" do
      user_detail = UserDetail.create! valid_attributes
      delete :destroy, :id => user_detail.id
      response.should redirect_to(user_details_url)
    end
  end

end
