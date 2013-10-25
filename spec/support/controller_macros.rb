module ControllerMacros
  def login_create_user(user_symbol=:user)
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[user_symbol]
      @user = FactoryGirl.create(user_symbol)
      sign_in @user
    end
  end

  def login_existing_user(user_symbol=:user)
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[user_symbol]
      attrs = FactoryGirl.attributes_for(user_symbol)
      @user = User.find_by_name(attrs[:name])
      sign_in @user
    end
  end

end
