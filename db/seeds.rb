# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
category = Category.create(name: 'Surgeon')
doctor = Doctor.create(category:)
User.create(phone: '+380956323404', full_name: 'Artyom', password: 'Asdasd', role: :doctor, userable: doctor)
category2 = Category.create!(name: 'Cardio')
doctor2 = Doctor.create(category: category2)
User.create(phone: '+380956323405', full_name: 'Kirill', password: 'Asdasd', role: :doctor, userable: doctor2)

doctor.avatar.attach(io: File.open('app/assets/images/doctor.png'), filename: 'doctor.png', content_type: 'image/png')
doctor2.avatar.attach(io: File.open('app/assets/images/doctor.png'), filename: 'doctor.png', content_type: 'image/png')

AdminUser.create!(phone: '123123123', password: 'password',
                  password_confirmation: 'password')
