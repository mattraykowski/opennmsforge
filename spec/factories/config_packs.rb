# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :config_pack do
    name "MyString"
    summary "MyText"
    install "MyText"
    user nil
  end
end
