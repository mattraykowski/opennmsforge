# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :config_pack do
    name "MyString"
    summary "MyText"
    install "MyText"
    vendor "MyVendor"
    product "MyProduct"
    user
  end
end
