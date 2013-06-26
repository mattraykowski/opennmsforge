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

describe ConfigPacksController do

  # This should return the minimal set of attributes required to create a valid
  # ConfigPack. As you add validations to ConfigPack, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ConfigPacksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all config_packs as @config_packs" do
      config_pack = ConfigPack.create! valid_attributes
      get :index, {}, valid_session
      assigns(:config_packs).should eq([config_pack])
    end
  end

  describe "GET show" do
    it "assigns the requested config_pack as @config_pack" do
      config_pack = ConfigPack.create! valid_attributes
      get :show, {:id => config_pack.to_param}, valid_session
      assigns(:config_pack).should eq(config_pack)
    end
  end

  describe "GET new" do
    it "assigns a new config_pack as @config_pack" do
      get :new, {}, valid_session
      assigns(:config_pack).should be_a_new(ConfigPack)
    end
  end

  describe "GET edit" do
    it "assigns the requested config_pack as @config_pack" do
      config_pack = ConfigPack.create! valid_attributes
      get :edit, {:id => config_pack.to_param}, valid_session
      assigns(:config_pack).should eq(config_pack)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ConfigPack" do
        expect {
          post :create, {:config_pack => valid_attributes}, valid_session
        }.to change(ConfigPack, :count).by(1)
      end

      it "assigns a newly created config_pack as @config_pack" do
        post :create, {:config_pack => valid_attributes}, valid_session
        assigns(:config_pack).should be_a(ConfigPack)
        assigns(:config_pack).should be_persisted
      end

      it "redirects to the created config_pack" do
        post :create, {:config_pack => valid_attributes}, valid_session
        response.should redirect_to(ConfigPack.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved config_pack as @config_pack" do
        # Trigger the behavior that occurs when invalid params are submitted
        ConfigPack.any_instance.stub(:save).and_return(false)
        post :create, {:config_pack => { "name" => "invalid value" }}, valid_session
        assigns(:config_pack).should be_a_new(ConfigPack)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ConfigPack.any_instance.stub(:save).and_return(false)
        post :create, {:config_pack => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested config_pack" do
        config_pack = ConfigPack.create! valid_attributes
        # Assuming there are no other config_packs in the database, this
        # specifies that the ConfigPack created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ConfigPack.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => config_pack.to_param, :config_pack => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested config_pack as @config_pack" do
        config_pack = ConfigPack.create! valid_attributes
        put :update, {:id => config_pack.to_param, :config_pack => valid_attributes}, valid_session
        assigns(:config_pack).should eq(config_pack)
      end

      it "redirects to the config_pack" do
        config_pack = ConfigPack.create! valid_attributes
        put :update, {:id => config_pack.to_param, :config_pack => valid_attributes}, valid_session
        response.should redirect_to(config_pack)
      end
    end

    describe "with invalid params" do
      it "assigns the config_pack as @config_pack" do
        config_pack = ConfigPack.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ConfigPack.any_instance.stub(:save).and_return(false)
        put :update, {:id => config_pack.to_param, :config_pack => { "name" => "invalid value" }}, valid_session
        assigns(:config_pack).should eq(config_pack)
      end

      it "re-renders the 'edit' template" do
        config_pack = ConfigPack.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ConfigPack.any_instance.stub(:save).and_return(false)
        put :update, {:id => config_pack.to_param, :config_pack => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested config_pack" do
      config_pack = ConfigPack.create! valid_attributes
      expect {
        delete :destroy, {:id => config_pack.to_param}, valid_session
      }.to change(ConfigPack, :count).by(-1)
    end

    it "redirects to the config_packs list" do
      config_pack = ConfigPack.create! valid_attributes
      delete :destroy, {:id => config_pack.to_param}, valid_session
      response.should redirect_to(config_packs_url)
    end
  end

end
