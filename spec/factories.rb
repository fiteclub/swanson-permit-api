FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    dob { Faker::Date.birthday(min_age: 18, max_age: 65) }
    ident_num { "MyString" }
    ident_state { "MyString" }
    ident_expir { "MyString" }
    ident_img { "MyString" }
    recom_num { "MyString" }
    recom_issuer { "MyString" }
    recom_expir { "2023-05-05 22:44:42" }
    recom_img { "MyString" }
  end
end
