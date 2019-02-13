# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  user = User.create!(first_name: Faker::Lebowski.character,last_name: Faker::LordOfTheRings.character,description: Faker::Lorem.sentence, email: Faker::Lebowski.character + "@yopmail.com")
end

20.times do
  event = Event.create!(title: Faker::SiliconValley.app, description: Faker::SiliconValley.motto, price: rand(1..999),location: Faker::LeagueOfLegends.location, start_date: Time.zone.tomorrow, duration: rand(1..15) * 5, administrator_id: rand(User.first.id..User.last.id))
end

20.times do
  attendance = Attendance.create!(attendee_id: rand(User.first.id..User.last.id), event_id: rand(Event.first.id..Event.last.id), stripe_customer_id: SecureRandom.urlsafe_base64)
end