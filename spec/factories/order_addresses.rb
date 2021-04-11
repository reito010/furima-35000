FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {'111-1111'}
    area_id {'3'}
    city { '網走'}
    street {'青1-1-1'}
    building {}
    phone_number { '090123456' }
  end
end
