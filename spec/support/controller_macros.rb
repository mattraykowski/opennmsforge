module ControllerMacros
  def login_create_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create(:user)
      sign_in @user
    end
  end

  def login_existing_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      attrs = FactoryGirl.attributes_for(:user)
      @user = User.find_by_name(attrs[:name])
      sign_in @user
    end
  end

end
