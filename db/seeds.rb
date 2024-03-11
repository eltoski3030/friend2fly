# Specific Destinations
Destination.create([
  { name: "Paris", description: "The City of Light is known for its cafe culture and the Eiffel Tower." },
  { name: "Tokyo", description: "A bustling metropolis that offers a unique blend of the traditional and the ultra-modern." },
  { name: "New York City", description: "The Big Apple, known for its vibrant culture and iconic skyline." }
])

# North American Countries
Destination.create([
  { name: "United States", description: "A diverse country with both natural wonders and vibrant cities." },
  { name: "Canada", description: "Known for its vast landscapes and polite residents." },
  { name: "Mexico", description: "A country rich in culture, cuisine, and stunning beaches." }
])

# European Countries
Destination.create([
  { name: "France", description: "Home to iconic landmarks like the Eiffel Tower and the Louvre." },
  { name: "Italy", description: "A country celebrated for its art, architecture, and culinary traditions." },
  { name: "Spain", description: "Famous for its festive culture, historical cities, and beautiful beaches." }
])

puts "Destinations seeded!"

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Destination.create([
  { name: "Paris", description: "The City of Light is known for its cafe culture and the Eiffel Tower." },
  { name: "Tokyo", description: "A bustling metropolis that offers a unique blend of the traditional and the ultra-modern." },
  { name: "New York City", description: "The Big Apple, known for its vibrant culture and iconic skyline." }
])

puts "Destinations seeded!"