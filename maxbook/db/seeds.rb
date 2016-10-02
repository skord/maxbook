# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



admin_user_attributes = {email: "admin@mariadb.com", is_admin: true, password: 'Welcome1', password_confirmation: 'Welcome1'}
user_attributes = {email: "user@mariadb.com", is_admin: false, password: 'Welcome1', password_confirmation: 'Welcome1'}

admin_user = User.where(email: "admin@mariadb.com")
user = User.where(email: "user@mariadb.com")

unless admin_user.any?
  User.create(admin_user_attributes)
end

unless user.any?
  User.create(user_attributes)
end

User.find_each do |user|
  100.times do
    name = FFaker::Name.name
    address= FFaker::AddressUS.street_address
    city= FFaker::AddressUS.city
    state= FFaker::AddressUS.state
    avatar = FFaker::Avatar.image
    Person.create(name: name, address: address, city: city, state: state, avatar: avatar, user_id: user.id)
  end
end
