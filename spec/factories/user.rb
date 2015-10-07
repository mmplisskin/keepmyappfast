FactoryGirl.define do

  factory :user do
	provider "facebook"
	uid "12345"
	name "Test User"
	email "example@example.com"
  end

  # factory :user2 class: User do
  # 	provider "google"
  # 	uid "12345"
  # 	name "Test User"
  # 	email "example@example.com"
  # end



end
