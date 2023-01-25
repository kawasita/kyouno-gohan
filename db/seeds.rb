# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

CSV.foreach('db/csv/rakuten.csv') do |row|
  pp Category.find_or_create_by(
    name: row[0],
    rakuten_category_id: row[1],
  )
end

# Admin.create!(
#   email: ENV['ADMIN_EMAIL'],
#   password: ENV['ADMIN_PASSWORD']
# )