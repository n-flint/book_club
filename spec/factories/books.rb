FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    pages { Faker::Number.between(2, 4032) }
    published { Faker::Number.between(1455, 2019) }
    cover { "" }
    average_rating { (Faker::Number.between(1.0, 5.0)).round(2) }
  end
end
