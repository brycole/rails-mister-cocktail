

require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drink_ingredients = JSON.parse(open(url).read)
puts 'Destroying ingredients...'
Ingredient.destroy_all
puts 'Seeding ingredients...'
drink_ingredients['drinks'].each do |i|
  Ingredient.create(name: i['strIngredient1'])
end
puts 'Finished seeding ingredients!'
