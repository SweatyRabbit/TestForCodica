# frozen_string_literal: true

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
