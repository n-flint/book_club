FactoryBot.define do
  factory :review do
    title { Faker::MostInterestingManInTheWorld.quote }
    review { Faker::TwinPeaks.quotes }
    rating { Faker::Number.between(1, 5) }
    user_id { 1 }
    book_id { 1 }
  end
end
