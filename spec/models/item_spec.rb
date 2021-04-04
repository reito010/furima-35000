require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報' do
    context '商品情報がうまくいくとき' do
      it "画像、商品名、説明、詳細、配送が存在する" do
        expect(@item).to be_valid
      end
    end

    context '商品情報がうまくいかないとき' do
      it "画像が存在しない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end

      it "商品名が存在してない" do
        @item.name = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "商品説明が存在してない" do
        @item.text = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it "詳細（カテゴリー）が１の時" do
      @item.category_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "詳細（状態）が１の時" do
        @item.status_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "配送（負担）が１の時" do
        @item.cost_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Cost must be other than 1")
      end
      it "配送（地域）が１の時" do
        @item.area_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Area must be other than 1")
      end
      it "配送（日数）が１の時" do
        @item.delivery_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Delivery must be other than 1")
      end
      it "price(価格）の記入が全角数字の時" do
        @item.price = '１０００'
       @item.valid?
       expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "price(価格）の範囲が300未満の時" do
        @item.price = '100'
       @item.valid?
       expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "price(価格）の範囲が10000000以上の時" do
        @item.price = '100000000'
       @item.valid?
       expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
      it "userが紐づいてない" do
        @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end

  
