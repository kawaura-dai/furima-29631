FactoryBot.define do
  factory :user do
    nickname              {"sato"}
    email                 {Faker::Internet.free_email}
    password              {"abc12345"}
    password_confirmation {"abc12345"}
    first_name            {"たかし"}
    first_name_furi       {"タカシ"}
    last_name             {"佐藤"}
    last_name_furi        {"サトウ"}
    birthday              {"1987-01-01"}
  end
end
