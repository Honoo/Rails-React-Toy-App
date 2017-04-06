# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_role = Role.create(name: 'User')
admin_role = Role.create(name: 'Admin')

User.create(first_name: 'John', last_name: 'Doe', email: 'john_doe@test.com', role_id: user_role.id, password: 'test123')
User.create(first_name: 'Jane', last_name: 'Doe', email: 'jane_doe@test.com', role_id: admin_role.id, password: 'test123')