# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "MyString"
    url "MyString"
    embed_code "MyText"
    image "MyString"
    description "MyText"
  end
end
