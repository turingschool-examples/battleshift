FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "foo#{n}@foo.com" }
    password "password"
    password_confirmation "password"
    api_key "VN81BL5DRAK704A5O41HG0Q8RGA1VSH5O"
  end

  factory :activated_user do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "foo#{n}@foo.com" }
    password "password"
    password_confirmation "password"
    activated true
    api_key "VN81BL5DRAK704A5O41HG0Q8RGA1VSH5O"
  end
  factory :activated_user_2 do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "foo2#{n}@foo.com" }
    password "password"
    password_confirmation "password"
    activated true
    api_key "VN81BL5DRAK704A5O41HG0Q8RGA1VSH5O"
  end
end
