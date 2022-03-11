require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品した商品の保存' do
    context '出品した商品が保存できる場合' do
     it 'image,name,info,category_id,sales_status_id,shipping_fee_status_id,prefecture_id,scheduled_delivery_id,price,userが存在すれば保存できる' do  
      expect(@item).to be_valid
      end
    end

    context '出品した商品が保存できない場合' do
      it '商品画像が空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end     
      it '商品名が空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では保存できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank") 
      end     
      it 'カテゴリーが未選択では保存できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category id can't be blank") 
      end
      it '商品の状態が未選択では保存できない' do
        @item.sales_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status id can't be blank") 
      end     
      it '配送料の負担が未選択では保存できない' do
        @item.shipping_fee_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status id can't be blank") 
      end
      it '発送元の地域が未選択では保存できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture id can't be blank") 
      end     
      it '発送までの日数が未選択では保存できない' do
        @item.scheduled_delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery id can't be blank")  
      end
      it '価格が空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")  
      end     
      it 'userが紐付いてなければ保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '価格が半角数値でなければ保存できない' do
        @item.price = 'aaa'
        @item.valid?
      end
      it '価格が¥300~¥9,999,999の間のみでなければ保存できない' do
        @item.price = '10'
        @item.valid?
        price

      end
    end
  end
end



                  

                
