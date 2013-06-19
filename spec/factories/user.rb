FactoryGirl.define do
  sequence :email do |n|
    "neil#{n}@tyson.org"
  end

  factory :user do
    uid 'foobar'
    provider 'google_oauth2'
    email
  end
end
