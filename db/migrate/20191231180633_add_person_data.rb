class AddPersonData < ActiveRecord::Migration[6.0]
	require 'faker'

	def change

		# 95000 because heroku's free DB has a 10,000 row limit
		9500.times do
			Person.new({
						   first_name: Faker::Name.first_name,
						   last_name: Faker::Name.last_name,
						   email: Faker::Internet.email,
						   age: Faker::Number.between(from: 1, to: 100),
						   moto: Faker::Company.bs,
						   address: Faker::Address.street_address,
						   city: Faker::Address.city,
						   state: Faker::Address.state,
						   zip: Faker::Address.postcode,
					   }).save!
		end
	end
end
