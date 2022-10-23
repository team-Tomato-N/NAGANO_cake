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

Member.create!(
  last_name:'試作',
  first_name:'太郎',
  last_furigana:'シサク',
  first_furigana:'タロウ',
  email:'test@webcamp.jp',
  postal_code:'1111111',
  address:'テスト県テスト市1-11',
  phone_number:'1234567890',
  password:'111111'
)


ShoppingAddress.create!(
  member_id:2,
  postal_code:'333333',
  address:'テスト県テスト市3-33',
  name:'試作太郎'
)

ShoppingAddress.create!(
  member_id:2,
  postal_code:'444444',
  address:'テスト県テスト市4-44',
  name:'試作二郎'
)

Item.create!(

  id:1,

  name:'ショートケーキ',

  explanation:'獲れたてのイチゴを使っています！',

  not_tax_price:450,
 )



 Item.create!(

  id:2,

  name:'チョコレートケーキ',

  explanation:'チョコレートが濃厚です！',

  not_tax_price:450,

 )



 Item.create!(

  id:3,

  name:'モンブラン',

  explanation:'地元でとれた栗を使用しています！',

  not_tax_price:450,

 )



 Item.create!(

  id:4,

  name:'ロールケーキ',

  explanation:'生クリームがたっぷり入っています！',

  not_tax_price:450,


 )



 Item.create!(

  id:5,

  name:'プリン',

  explanation:'口当たりがまろやかな人気商品です！',

  not_tax_price:300,

 )



 Item.create!(

  id:6,

  name:'シュークリーム',

  explanation:'外の生地はサクサクで、中のクリームは濃厚です！',

  not_tax_price:300,

 )

CartItem.create!(
  member_id:2,
  item_id:1,
  quantity:3
)

CartItem.create!(
  member_id:2,
  item_id:2,
  quantity:5
)

CartItem.create!(
  member_id:2,
  item_id:3,
  quantity:2
)

CartItem.create!(
  member_id:2,
  item_id:4,
  quantity:1
)

CartItem.create!(
  member_id:2,
  item_id:5,
  quantity:3
)

CartItem.create!(
  member_id:2,
  item_id:6,
  quantity:4
)

Admin.create!(
 email:'admin@webcamp.jp',
 password:'password'
)