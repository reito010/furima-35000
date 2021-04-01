FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.username }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    myoji { '山田' }
    namae { '太郎' }
    myoji_kana { 'ヤマダ' }
    namae_kana { 'タロウ' }
    birthday { '1999-01-01' }
  end
end
