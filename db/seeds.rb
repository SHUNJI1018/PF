# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者のログイン
Admin.create!(
  email: 'admin@admin.com',
  password: '000000'
)

# ゲストユーザー
Customer.create!(
  nickname: 'ゲスト',
  last_name: 'てすと',
  first_name: 'たろう',
  last_kana_name: 'テスト',
  first_kana_name: 'タロウ',
  email: 'guest1@guest.com',
  password: 'guest123'
)
