FactoryBot.define do
  factory :user do
    first_name { "John" }
  	last_name { "Doe" }
  	email { "john.doe@email.com" }
  	encrypted_password { "Ert890Ert" }
		description {"Je suis super heureux de participer au test"}
  end
end
