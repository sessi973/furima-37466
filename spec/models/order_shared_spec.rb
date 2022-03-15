require 'rails_helper'

RSpec.describe OrderShared, type: :model do
  describe '商品購入機能' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_shared = FactoryBot.build(:order_shared, user_id: @user.id, item_id: @item.id)
      sleep(1)
    end

    context '購入できるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shared).to be_valid
      end
      it '建物名は空でも保存できること' do

      end
    end

    context '購入できないとき' do
      it 'tokenが空では登録できない' do
        @order_shared.token = nil
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Token can't be blank")       
      end
      it '郵便番号が空だと登録できない' do
        @order_shared.postal_code = ''
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Postal code can't be blank") 
      end
      it '郵便番号「3桁ハイフン4桁」ではないと登録できない' do
        @order_shared.postal_code = '0000-000'
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は半角数字でないと登録できない' do
        @order_shared.postal_code = aaa-bbbb
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県が未選択では登録できない' do
        @order_shared.prefecture_id = 1
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空では登録できない' do
        @order_shared.city = ''
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では登録できない' do
        @order_shared.addresses = ''
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Addresses can't be blank")
      end
      it '電話番号が空では登録できない' do
        @order_shared.phone_number = ''
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Phone_number can't be blank")
      end
      it '電話番号が10桁以下では登録できない' do
        @order_shared.phone_number = 000000000
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Phone_number can't be blank")
      end
      it '電話番号が11桁以上では登録できない' do
        @order_shared.phone_number = 7777777777777
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Phone_number can't be blank")
      end
      it '電話番号が半角文字混合だと登録できない' do
        @order_shared.phone_number = aaaあああああああああ
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Phone_number can't be blank")
      end
      it '電話番号に-があると登録できない' do
        @order_shared.phone_number = 000-0000-0000
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Phone_number can't be blank")
      end
    end
  end
end  
  
