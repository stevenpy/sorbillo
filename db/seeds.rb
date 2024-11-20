# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
user = User.where(email: "steven@steven.fr").first_or_initialize
user.update!(
  password: "password",
  password_confirmation: "password"
)

[
  "Abricot", "Airelles", "Alkékenge", "Amélanche", "Ananas", "Arbouse", "Asimine",
  "Banane", "Banane verte", "Barbadine", "Bergamote", "Bigarade", "Brugnon",   
  "Canneberge", "Carambole", "Cassis", "Cerise", "Cerise de cayenne", "Clémentine",
  "Coing", "Combava", "Cornouille", "Cynorrhodon", "Durian", "Epine-vinette",
  "Fe'i", "Feijoa", "Figue", "Figue de Barbarie", "Fraise", "Framboise",
  "Fruit-à-pain", "Fruit de la passion", "Girembelle", "Goyave", "Grapefruit",
  "Grenade", "Grenadelle", "Grenadille", "Griotte", "Groseille", "Icaque",
  "Jambose rouge", "Jaque", "Jujube", "Kaki", "Kiwi", "Kumquat", "Kiwano", "Litchi"
].each do |name|
  Ingredient.find_or_create_by!(name: name)
end