FactoryBot.define do
  factory :customer do
    nickname { Faker::Lorem.characters(number: 10) }
    last_name { Faker::Lorem.characters(number: 10) }
    first_name { Faker::Lorem.characters(number: 10) }
    last_kana_name { 'アイウ' }
    first_kana_name { 'エオ' }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
