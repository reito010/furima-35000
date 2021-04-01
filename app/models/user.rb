class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #has_many :items
  #has_many :orders

  with_options presence: true do

    validates :nickname
    validates :myoji
    validates :namae
    validates :myoji_kana
    validates :namae_kana
    validates :birthday

    with_options format: { with:  /\A[ァ-ヶー－]+\z/, message: '全角文字を使用してください' } do
     
      validates :myoji_kana
      validates :namae_kana
    end
   
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :myoji
    validates :namae
    end

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  end
end
