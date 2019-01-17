# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#Create Users
10.times do
    pw = Faker::Internet.password(8)
    User.create!(
        # name: Faker::GameOfThrones.character,
        email: Faker::Internet.safe_email,
        password: pw,
        password_confirmation: pw,
        confirmed_at: Time.now
    )
end
users = User.all

#Create Wikis
25.times do
    Wiki.create!(
        user: users.sample,
        title: Faker::Lovecraft.deity,
        body: Faker::Lovecraft.paragraph,
        private: false
    )
end

#Create an admin user
admin = User.create!(
    # name: 'Admin User',
    email: 'admin@example.com',
    password: 'helloworld',
    password_confirmation: 'helloworld',
    confirmed_at: Time.now,
    role: 'admin'
)

#Create a premium user
premium = User.create!(
    # name: 'Premium User',
    email: 'premium@example.com',
    password: 'helloworld',
    password_confirmation: 'helloworld',
    confirmed_at: Time.now,
    role: 'premium'
)

#Create a standard user
standard = User.create!(
    # name: 'Standard User',
    email: 'standard@example.com',
    password: 'helloworld',
    password_confirmation: 'helloworld',
    confirmed_at: Time.now,
    role: 'standard'
)

puts "Seeds finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
