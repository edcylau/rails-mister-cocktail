# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

puts "Destroy all data.."
Ingredient.destroy_all

puts "Creating a new DB.."

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
url_file = open(url).read
list = JSON.parse(url_file)

drinks = list["drinks"]

drinks.each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
  puts "#{ingredient["strIngredient1"]} is created"
end

puts "#{Ingredient.count} ingredients are created"
