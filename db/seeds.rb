# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(full_name: "Key", password: "pass12345", age: 22, email:"rfirstanto@gmail.com", gender:"male", birth_date: "29, Desember 1997", phone_number: 9717, image_path: "https://i1.rgstatic.net/ii/profile.image/613184293568512-1523205936464_Q512/Keyza-Firstanto.jpg", is_admin: false, is_active: true)
#patient = Patient.create(patient_name: "Ivan", status: "single", gender: "male", birth_date: "30 mei 1999", blood_type: "O", age: "22")

# 10.times do
#     patient_name_patient = Faker::Name.name
#     status_patient = Faker::Verb.base
#     gender_patient = Faker::Gender.binary_type
#     birth_date_patient = Faker::Date.birthday(min_age: 18, max_age: 65)
#     blood_type_patient = Faker::Blood.type #=> "AB"
#     age_patient = Faker::Number.number(digits: 2)
#     Patient.create(patient_name: patient_name_patient, status: status_patient, gender: gender_patient, birth_date: birth_date_patient, blood_type: blood_type_patient, age: age_patient)
# end

# 10.times do
#     doctor_name_doctor = Faker::Name.name
#     image_path_doctor = Faker::File.file_name(dir: 'path/to')
#     speciality_doctor = Faker::Verb.base
#     status_doctor = Faker::Verb.base
#     star_doctor = Faker::Verb.base 
#     location_practice_doctor = Faker::Address.street_address
#     biography_doctor = Faker::Lorem.paragraphs
#     education_doctor = Faker::Educator.university
#     price_rate_doctor = Faker::Number.number(digits: 4)
#     Doctor.create(doctor_name: doctor_name_doctor, image_path: image_path_doctor, speciality: speciality_doctor, status: status_doctor, star: star_doctor, location_practice: location_practice_doctor, biography: biography_doctor, education: education_doctor, price_rate: price_rate_doctor)
# end

# 10.times do
#     article_category_A = Faker::Verb.base
#     article_title_A = Faker::Verb.base
#     image_url_A = Faker::File.file_name(dir: 'path/to')
#     content_desc_A = Faker::Lorem.paragraphs
#     Article.create(article_category: article_category_A ,article_title: article_title_A, image_url: image_url_A ,content_desc: content_desc_A)
# end



