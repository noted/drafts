FactoryGirl.define do
  sequence :email do |n|
    "neil#{n}@tyson.org"
  end

  factory :user do
    email
    password 'foobar'
  end
end
