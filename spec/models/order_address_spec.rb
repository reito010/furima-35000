require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.5
  end

  describe '購入情報' do
    context '購入情報がうまくいくとき'
      it "郵便番号・都道府県・市区町村・番地・電話番号が全てあるとき" do 
           expect(@address).to be_valid
      end
    end

    context '購入情報がうまくいかないとき'
      it "郵便番号がない" do
        @address.postal_code = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
      end
       
      it "都道府県がない" do
        @address.area_id = 1
        @address.valid?
        expect(@address.errors.full_messages).to include("Area can't be blank")
      end

      it "市町村がないとき" do
        @address.city = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end

      it "番地がないとき" do
        @address.street = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Street can't be blank")
      end

      it "電話番号がないとき" do
        @address.phone_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end

      it "郵便番号にハイフンがないとき" do
        @address.postal_code = '1111111'
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it "電話番号が11桁以内のとき" do
        @address.phone_number = '090123456789'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
  
      it "tokenが空では登録できないこと" do
        @address.token = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Token can't be blank")
      end


end
