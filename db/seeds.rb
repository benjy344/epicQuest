# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.new(email: 'admin@gmail.com', encrypted_password: '$2a$11$Rf1Q2pQ.EfAz5rlrg.rMqu7NVqhmqIzVPoMCyiwT6VjhDzQpbBYyu', username: "admin", sign_in_count: 1, current_sign_in_at:'2018-01-29 12:50:20.846289', last_sign_in_at: '2018-01-29 12:38:53.822559', created_at: '2018-01-28 21:40:16.913178', updated_at:'2018-01-29 12:50:20.847950', role: 'admin', avatar_id: 1).save()

Avatar.new(name:'AdminAvatar', hp: 999999, level: 999999, exp: 999999, countUnlockDonjon: 999999, MaxHealth: 999999, job_id: 1, user_id: 1, inteligence: 999999, agility: 999999, force: 999999).save()