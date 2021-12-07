# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(full_name: "Key", password: "pass12345", age: 22, email:"rfirstanto@gmail.com", gender:"male", birth_date: "29, Desember 1997", phone_number: 9717, image_path: "https://i1.rgstatic.net/ii/profile.image/613184293568512-1523205936464_Q512/Keyza-Firstanto.jpg", is_admin: false, is_active: true)

doctor = Doctor.create(full_name)