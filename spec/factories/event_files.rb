# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event_file do
    name "MyString"
    content "MyText"
    config_pack nil
  end
end
