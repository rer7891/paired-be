FactoryBot.define do
  factory :user do
    name {Faker::FunnyName.name}
    mod { Faker::Number.within(range: 1..5)}
    program { "BE" }
    pronouns { "She/her" }
    slack  {Faker::FunnyName.name}
    email { Faker::Internet.email }
    image { Faker::LoremFlickr.image }
    phone_number { "5555550100" }
    firebase_id { Faker::Alphanumeric.alphanumeric(number: 28 )}
  end
end
