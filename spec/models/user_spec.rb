require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context  'ユーザー管理ができている時'  do
    it 'nicknameとemail、passwordとpassword_confirmation,myojiとnamae,myoji_kanaとnamae_kana,birthdayが存在すれば登録できること' do
      expect(@user).to be_valid
    end
  end

  context 'ユーザー管理がうまくいってない時' do
    it 'nicknameが空では登録できないこと' do
       @user.nickname = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
       @user.email = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できないこと' do
       @user.password = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'password_confirmationが空では登録できないこと' do
       @user.password_confirmation = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  
    it 'myojiが空では登録できないこと' do
       @user.myoji = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Myoji can't be blank")
    end
  
    it 'namaeが空では登録できないこと' do
       @user.namae = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Namae can't be blank")
    end

    it 'myoji_kanaが空では登録できないこと' do
       @user.myoji_kana = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Myoji kana can't be blank")
    end

    it 'namae_kanaが空では登録できないこと' do
       @user.namae_kana = ''
       @user.valid?
      expect(@user.errors.full_messages).to include("Namae kana can't be blank")
    end

    it 'birthdayが空では登録できないこと' do
    @user.birthday = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'password:半角英数混合(半角英語のみ)' do
    @user.password = 'aaaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it 'password:半角英数混合(半角数字のみ)' do
    @user.password = '111111'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
   end

    it 'passwordが６文字未満' do
    @user.password = '11a11'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'emailが@を含まない' do
    @user.email = 'test.test'
    @user.valid?
    expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'emailの重複すると登録できない' do
    @user.save
    another_user = FactoryBot.build(:user, email: @user.email)
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'パスワードと確認用のパスワードが一致しないと登録できない' do
    @user.password = FactoryBot.build(:user)
    @user.password_confirmation = FactoryBot.build(:user)
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it 'パスワード全角文字だと登録できない' do
    @user.password = '1q1q１q'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it 'myoji_kana 半角文字だと登録できない' do
    @user.myoji_kana = 'ﾔﾏﾀﾞ'
    @user.valid?
    expect(@user.errors.full_messages).to include("Myoji kana 全角文字を使用してください")
    end

    it 'namae_kana 半角文字だと登録できない' do
    @user.namae_kana = 'ﾀﾛｳ'
    @user.valid?
    expect(@user.errors.full_messages).to include("Namae kana 全角文字を使用してください")
    end

    it 'myoji_kana カタカナ以外の全角文字は登録できない' do
    @user.myoji_kana = 'やまだ'
    @user.valid?
    expect(@user.errors.full_messages).to include("Myoji kana 全角文字を使用してください")
    end

    it 'namae_kana カタカナ以外の全角文字は登録できない' do
    @user.namae_kana = 'たろう'
    @user.valid?
    expect(@user.errors.full_messages).to include("Namae kana 全角文字を使用してください")
    end

    it 'namae 半角文字だと登録できない' do
    @user.namae = 'ﾀﾛｳﾞ'
    @user.valid?
    expect(@user.errors.full_messages).to include("Namae 全角文字を使用してください")
    end

    it 'myoji 半角文字だと登録できない' do
    @user.myoji = 'ﾀﾅｶ'
    @user.valid?
    expect(@user.errors.full_messages).to include("Myoji 全角文字を使用してください")
   end
  end
end