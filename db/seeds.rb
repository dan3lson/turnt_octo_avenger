puts "==============================================="
puts "Creating Categories"
puts "==============================================="

Category.create(name: 'Dominican')
Category.create(name: 'German')
Category.create(name: 'Gluten-Free')
Category.create(name: 'Greek')
Category.create(name: 'Haitian')
Category.create(name: 'Halal')
Category.create(name: 'Hawaiian')
Category.create(name: 'Himalayan')

Category.all.each { |category| puts "Category name: " << category.name }

puts "==============================================="
puts "Creating Restaurants (without descriptions)"
puts "==============================================="

10.times do
  Restaurant.create(
    name: Faker::Company.name,
    street1: Faker::Address.street_name,
    street2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zipcode: Faker::Address.zip_code
  )
end

Restaurant.where(description: nil).each do |restaurant|
  puts "Restaurant name: " << restaurant.name
  puts "Restaurant street1: " << restaurant.street1
  puts "Restaurant street2: " << restaurant.street2
  puts "Restaurant city: " << restaurant.city
  puts "Restaurant state: " << restaurant.state
  puts "Restaurant zipcode: " << restaurant.zipcode
  puts
end

puts "==============================================="
puts "Creating Restaurants (with descriptions)"
puts "==============================================="

10.times do
  Restaurant.create(
    name: Faker::Company.name,
    street1: Faker::Address.street_name,
    street2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zipcode: Faker::Address.zip_code,
    description: Faker::Lorem.sentence,
  )
end

Restaurant.where("description IS NOT NULL").each do |restaurant|
  puts "Restaurant name: " << restaurant.name
  puts "Restaurant street1: " << restaurant.street1
  puts "Restaurant street2: " << restaurant.street2
  puts "Restaurant city: " << restaurant.city
  puts "Restaurant state: " << restaurant.state
  puts "Restaurant zipcode: " << restaurant.zipcode
  puts "Restaurant description: " << restaurant.description
  puts
end

puts "==============================================="
puts "Creating Restaurant Categories"
puts "==============================================="

10.times do
  RestaurantCategory.create(
    category_id: Category.all.sample.id,
    restaurant_id: Restaurant.all.sample.id
  )
end

RestaurantCategory.all.each do |restaurant_category|
  puts "Category ID: " << restaurant_category.category_id.to_s
  puts "Restaurant ID: " << restaurant_category.restaurant_id.to_s
end

puts "==============================================="
puts "Creating Reviews"
puts "==============================================="

100.times do
  Review.create(
    rating: (1..5).to_a.sample,
    restaurant_id: Restaurant.all.sample.id,
    description: Faker::Lorem.sentence
  )
end

Review.all.each do |review|
  puts "Rating: " << review.rating.to_s
  puts "Description: " << review.description
  puts "Restaurant ID: " << review.restaurant_id.to_s
  puts
end

puts "==============================================="
puts "Seeding SUCCESSFUL"
puts "==============================================="
