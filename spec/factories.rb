FactoryBot.define do
  factory :user do
    name { Faker::TvShows::ParksAndRec.character }
    email { Faker::Internet.email }
    dob { Faker::Date.birthday(min_age: 18, max_age: 65) }
    ident_num { Faker::DrivingLicence.usa_driving_licence }
    ident_state { Faker::Address.state_abbr }
    ident_expir { Faker::Date.between(from: 1.month.ago, to: 4.years.from_now) }
    ident_img { 'https://shrouded-citadel-46945.herokuapp.com/ident001.jpg' }
    permit_num { Faker::Color.hex_color }
    permit_issuer { Faker::TvShows::StarTrek.villain }
    permit_expir { Faker::Date.between(from: 1.month.ago, to: 4.years.from_now) }
    permit_img { 'https://shrouded-citadel-46945.herokuapp.com/permit001.jpg' }
  end
end
