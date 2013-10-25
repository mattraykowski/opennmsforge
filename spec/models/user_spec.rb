# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#

require 'spec_helper'

describe User do
  before(:each) { @user = FactoryGirl.create(:user) }
  subject { @user }

  it { should be_valid }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:encrypted_password) }

  it { should respond_to(:config_packs) }
  it { should respond_to(:name) }
  it { should respond_to(:oca) }
  it { should respond_to(:ogp) }
  it { should respond_to(:admin) }

  describe "when email is not present" do
    before { @user.email = " " }

    it { should_not be_valid }
  end


  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
      addresses.each do |address|
        @user.email = address
        @user.should be_valid
      end
    end
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |address|
        @user.email = address
        @user.should_not be_valid
      end
    end
  end

  describe "when duplicate email address" do
    before do
      @user_with_duplicate_email = @user.dup
      @user_with_duplicate_email.email = @user.email.upcase
      @user_with_duplicate_email.save
    end
    subject { @user_with_duplicate_email }

    it { should_not be_valid }
  end

  describe "password validations" do
    describe "when password is blank" do
      before do
        @user.password = ""
        @user.password_confirmation = ""
      end

      it { should_not be_valid }
    end

    describe "when password confirmation does not match" do
      before { @user.password_confirmation = "invalid" }
      it { should_not be_valid }      
    end

    describe "when passwords are too short" do
      before do
        @user.password = "a" * 5
        @user.password_confirmation = "a" * 5
      end
      it { should_not be_valid }
    end
  end

  describe "password encryption" do
    it "should set the encrypted password attribute" do
      @user.encrypted_password.should_not be_blank
    end
  end

  it "should default OCA to false" do
    @user.oca.should == false
  end

  it "should default OGP to false" do
    @user.ogp.should == false
  end

  it "should default admin to false" do
    @user.admin.should == false
  end
end
