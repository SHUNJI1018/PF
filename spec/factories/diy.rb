FactoryBot.define do
  factory :diy do
    diy_name { Faker::Lorem.characters(number: 5) }
    explanation { Faker::Lorem.characters(number: 10) }
    image_id { 'sample.jpg' }
    customer
    genre
  end
end
