FactoryBot.define do
  factory :user do
    name { Faker::TvShows::ParksAndRec.character }
    email { Faker::Internet.email }
    dob { Faker::Date.birthday(min_age: 18, max_age: 65) }
    ident_num { Faker::DrivingLicence.usa_driving_licence }
    ident_state { Faker::Address.state_abbr }
    ident_expir { Faker::Date.between(from: 1.month.ago, to: 4.years.from_now) }
    ident_img { 'identification.jpg' }
    recom_num { Faker::Color.hex_color }
    recom_issuer { Faker::TvShows::StarTrek.villain }
    recom_expir { Faker::Date.between(from: 1.month.ago, to: 4.years.from_now) }
    recom_img { 'recommendation.png' }
  end
end
