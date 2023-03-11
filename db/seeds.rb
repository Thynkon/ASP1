# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Create admin role if it doesn't exist

### Roles
admin_role = Role.find_or_create_by(slug: "admin", name: "Administrator")
user_role = Role.find_or_create_by(slug: "user", name: "User")

### Users
#admin_user = Teacher.find_or_create_by(email: "thynkon@asdf.asdf", password: "asdfasdf", password_confirmation: "asdfasdf", roles: [admin_role, user_role])
# First or create the user if exists
if !Teacher.exists?(email: "thynkon@asdf.asdf")
  admin_user = Teacher.create(email: "thynkon@asdf.asdf", password: "asdfasdf", password_confirmation: "asdfasdf", roles: [admin_role])
end