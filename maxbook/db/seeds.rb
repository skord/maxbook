# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
  name = FFaker::Name.name
  address= FFaker::AddressUS.street_address
  city= FFaker::AddressUS.city
  state= FFaker::AddressUS.state
  avatar = FFaker::Avatar.image
  Person.create(name: name, address: address, city: city, state: state, avatar: avatar)
end
