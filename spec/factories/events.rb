FactoryBot.define do
  factory :event do
    start_date { Time.zone.tomorrow }
  	duration { 45 }
  	title { "Renewal of the World" }
  	description { "How to Change the World (at least) in 7 Easy Steps" }
  	price { 12 }
  	location { "Paris" }
		administrator { FactoryBot.create(:user) }
  end
end
