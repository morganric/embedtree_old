# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category_post do
    post_id 1
    category_id ""
    user_id 1
  end
end
