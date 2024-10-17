# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ['Action', 'Comedy', 'Drama', 'Horror'].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Cleaning the database...'
Restaurant.destroy_all
Review.destroy_all # Make sure to clean the reviews as well

puts 'Creating restaurants...'

restaurants = [
  { name: 'Sichuan Delight', address: '123 Main St, Toronto', phone_number: '416-123-4567', category: 'chinese' },
  { name: 'Pasta Heaven', address: '456 King St, Toronto', phone_number: '416-234-5678', category: 'italian' },
  { name: 'Sushi World', address: '789 Queen St, Toronto', phone_number: '416-345-6789', category: 'japanese' },
  { name: 'Le Bistro', address: '101 Prince St, Montreal', phone_number: '514-123-4567', category: 'french' },
  { name: 'Belgian Waffles', address: '202 Sherbrooke St, Montreal', phone_number: '514-234-5678', category: 'belgian' }
]

restaurants.each do |restaurant|
  new_restaurant = Restaurant.create!(restaurant)

  # Generate a random number of reviews between 2 and 5
  rand(2..5).times do
    Review.create!(
      rating: rand(1..5),  # Random rating between 1 and 5
      content: Faker::Restaurant.review,  # Random content (you need to add the 'faker' gem for this)
      restaurant: new_restaurant
    )
  end
end

puts 'Finished creating restaurants and reviews!'
