# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.create([
  { title: "Titanic", release_date: Date.today },
  { title: "Avengers", release_date: Date.today },
  { title: "ET", release_date: Date.today },
  { title: "Back To The Future", release_date: Date.today },
  { title: "The Matrix", release_date: Date.today },
  { title: "Se7en", release_date: Date.today },
  { title: "Office Space", release_date: Date.today },
])