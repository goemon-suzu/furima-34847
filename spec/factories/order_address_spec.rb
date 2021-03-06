FactoryBot.define do
  factory :order_address do
    postal_code                    { '123-4567' }
    prefecture_id                  { 1 }
    city                           { '世田谷区' }
    street_address                 { '1-2-3' }
    building_name                  { 'マンションA' }
    phone_number                   { '09012345678' }
    token                          { 'tok_abcdefghijk00000000000000000' }
  end
end
