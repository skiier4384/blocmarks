require 'faker'

# Create Users
10.times do
    User.create!(
      #name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Internet.password
    )
end

users = User.all
puts "#{User.count} users created."

# Create Topics
30.times do
  Topic.create!(
    title: Faker::ChuckNorris.fact,
    user:  users.sample
  )
end

topics = Topic.all
puts "#{topics.count} topics created."

puts "Seed finished"