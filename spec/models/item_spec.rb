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
        @item.image = ''
        @item.valid?
        binding.pry
      expect(@item.errors.full_messages).to include("Image can't be blank")
      end     
      it '商品名が空では保存できない' do
        name
      end
      it '商品の説明が空では保存できない' do
        info
      end     
      it 'カテゴリーが空では保存できない' do
        category_id
      end
      it '商品の状態の情報が空では保存できない' do
        sales_status_id
      end     
      it '配送料の負担の情報が空では保存できない' do
        shipping_fee_status_id
      end
      it '発送元の地域の情報が空では保存できない' do
        prefecture_id
      end     
      it '発送までの日数の情報が空では保存できない' do
        scheduled_delivery_id
      end
      it '価格が空では保存できない' do
        price
      end     
      it 'userが紐付いてなければ保存できない' do

      end
      it '価格が半角数値でなければ保存できない' do
        price
      end
      it '価格が¥300~¥9,999,999の間のみでなければ保存できない' do
        price
      end
    end
  end
end



                  
validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}          
validates :sales_status_id, numericality: { other_than: 1 , message: "can't be blank"}         
validates :shipping_fee_status_id, numericality: { other_than: 1 , message: "can't be blank"}   
validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}          
validates :scheduled_delivery_id, numericality: { other_than: 1 ,message: "can't be blank"}  
                
