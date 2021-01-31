FactoryBot.define do
  factory :user_donation do
    prefecture_id               { 2 }
    municipality                { 'テスト１−１' }
    building_name               { 'テスト２−２' }
    postal_code                 { '123-4567' }
    street_add                  { 'テスト３−３' }
    phone_number                { '09012345678' }
    token                       {"tok_abcdefghijk00000000000000000"}
    association :user

  end
end
