# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Member.create!(
    id:2,
    last_name:'試作',
    first_name:'花子',
    last_furigana:'シサク',
    first_furigana:'ハナコ',
    email:'test2@webcamp.jp',
    postal_code:'2222222',
    address:'テスト県テスト市2-22',
    phone_number:'0987654321',
    password:'222222'
  )