require 'spec_helper'

describe ConfigPacksController do
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ConfigPacksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all config_packs as @config_packs" do
      config_pack = FactoryGirl.create(:config_pack)
      get :index, {}, valid_session
      assigns(:config_packs).should eq([config_pack])
    end
  end

  describe "GET show" do
    it "assigns the requested config_pack as @config_pack" do
      config_pack = FactoryGirl.create(:config_pack)
      get :show, {:id => config_pack.to_param}, valid_session
      assigns(:config_pack).should eq(config_pack)
    end
  end

  describe "logged in as a valid user" do
    describe "GET new" do
      login_create_user

      it "assigns a new config_pack as @config_pack" do
        get :new, {}
        assigns(:config_pack).should be_a_new(ConfigPack)
      end
    end

    describe "GET edit" do
      before { @config_pack = FactoryGirl.create(:config_pack) }
      login_existing_user

      it "assigns the requested config_pack as @config_pack" do
        get :edit, {:id => @config_pack.to_param}
        assigns(:config_pack).should eq(@config_pack)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        before { @valid_attributes = FactoryGirl.attributes_for(:config_pack) }
        login_create_user

        it "creates a new ConfigPack" do
          expect {
            post :create, {:config_pack => @valid_attributes}
          }.to change(ConfigPack, :count).by(1)
        end

        it "assigns a newly created config_pack as @config_pack" do
          post :create, {:config_pack => @valid_attributes}
          assigns(:config_pack).should be_a(ConfigPack)
          assigns(:config_pack).should be_persisted
        end

        it "redirects to the created config_pack" do
          post :create, {:config_pack => @valid_attributes}
          response.should redirect_to(ConfigPack.last)
        end
      end

      describe "with invalid params" do
        login_create_user

        it "assigns a newly created but unsaved config_pack as @config_pack" do
          # Trigger the behavior that occurs when invalid params are submitted
          ConfigPack.any_instance.stub(:save).and_return(false)
          post :create, {:config_pack => { "name" => "invalid value" }}
          assigns(:config_pack).should be_a_new(ConfigPack)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          ConfigPack.any_instance.stub(:save).and_return(false)
          post :create, {:config_pack => { "name" => "invalid value" }}
          response.should render_template("new")
        end
      end
    end

    describe "DELETE destroy" do
      before(:each) do
        @config_pack = FactoryGirl.create(:config_pack)
      end
      login_existing_user

      it "destroys the requested config_pack" do
        #config_pack = FactoryGirl.create(:config_pack)
        expect {
          delete :destroy, {:id => @config_pack.to_param}
        }.to change(ConfigPack, :count).by(-1)
      end

      it "redirects to the config_packs list" do
        #config_pack = FactoryGirl.create(:config_pack)
        delete :destroy, {:id => @config_pack.to_param}
        response.should redirect_to(config_packs_url)
      end
    end

  describe "PUT update" do
    describe "with valid params" do
      before { @config_pack = FactoryGirl.create(:config_pack) }
      login_existing_user

      it "updates the requested config_pack" do
        # Assuming there are no other config_packs in the database, this
        # specifies that the ConfigPack created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ConfigPack.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => @config_pack.to_param, :config_pack => { "name" => "MyString" }}
      end

      it "assigns the requested config_pack as @config_pack" do
        put :update, {:id => @config_pack.to_param, :config_pack => FactoryGirl.attributes_for(:config_pack)}
        assigns(:config_pack).should eq(@config_pack)
      end

      it "redirects to the config_pack" do
        put :update, {:id => @config_pack.to_param, :config_pack => FactoryGirl.attributes_for(:config_pack)}
        response.should redirect_to(@config_pack)
      end
    end

    describe "with invalid params" do
      before(:each) do
        @config_pack = FactoryGirl.create(:config_pack)
      end
      login_existing_user

      it "assigns the config_pack as @config_pack" do
        # Trigger the behavior that occurs when invalid params are submitted
        ConfigPack.any_instance.stub(:save).and_return(false)
        put :update, {:id => @config_pack.to_param, :config_pack => { "name" => "invalid value" }}
        assigns(:config_pack).should eq(@config_pack)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ConfigPack.any_instance.stub(:save).and_return(false)
        put :update, {:id => @config_pack.to_param, :config_pack => { "name" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end

  end
end
