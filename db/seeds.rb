# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: 'admin', email: 'admin@example.com', password: 'password', password_confirmation: 'password',admin: true, editor: true) if Rails.env.development?
User.create!(name: 'sample', email: 'sample@example.com', password: 'password', password_confirmation: 'password',admin: false, editor: true) if Rails.env.development?
