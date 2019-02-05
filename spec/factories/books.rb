FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    pages { Faker::Number.between(2, 4032) }
    published { Faker::Number.between(1455, 2019) }
    cover { "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd3cgsv8lMoNU4g8dDN1hUqKlXAR3DTITUd5rl1tMuYds_wAP6" }
    average_rating { (Faker::Number.between(1.0, 5.0)).round(2) }
  end
end
