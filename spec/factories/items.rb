FactoryBot.define do
  factory :item do
    association :user
    name { '商品' }
    text { 'アイウエオ' }
    category_id {2}
    status_id  {2}
    cost_id {2}
    area_id {2}
    delivery_id {2}
    price {1000}

    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png')
    end
  end
end
