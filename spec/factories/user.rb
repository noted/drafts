FactoryGirl.define do
  sequence :email do |n|
    "neil#{n}@tyson.org"
  end

  factory :user do
    name 'Neil deGrasse Tyson'
    email
  end
end
