# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Deleteing seeds"
User.destroy_all
Company.destroy_all
Project.destroy_all
Comment.destroy_all
Milestone.destroy_all

puts "Creating data"
lto = Company.create!(name: "SEQC")
helio = Company.create!(name: "Helio digital studio")
designer = User.create!(email: 'designer@gmail.com', password: 'password', role: 'member', company: helio)
admin = User.create!(email: 'admin@gmail.com', password: 'password', role: 'admin', company: helio)
client = User.create!(email: 'client@gmail.com', password: 'password', role: 'client', company: lto)

website_project = Project.create!(name: 'Website redesign for labtestsonline.es', description: 'Website redesign for Lab tests online consisting of branding, logo design and SEO')
