class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :email, presence: true
  validates :encrypted_password, presence: true, length: { minimum: 6 }
  validates :nickname,     presence: true
  validates :myoji,        presence: true
  validates :namae,        presence: true
  validates :myoji_kana,   presence: true
  validates :namae_kana,   presence: true
  validates :birthday,     presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :myoji
    validates :namae
    validates :myoji_kana
    validates :namae_kana
  end

  VALID_PASSWORD_REGEX = /[a-z\d]{6,}/i
  validates :password, presence: true,
                       format: { with: VALID_PASSWORD_REGEX,
                                 message: 'は半角6文字以上英大文字・小文字・数字それぞれ１文字以上含む必要があります' }

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
