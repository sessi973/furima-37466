require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品した商品の保存' do
    context '出品した商品が保存できる場合' do
      it 'image,name,info,category_id,sales_status_id,shipping_fee_status_id,prefecture_id,scheduled_delivery_id,price,userが存在すれば保存できる' do
      end
    end
    context '出品した商品が保存できない場合' do
      it 'imageが空では保存できない' do
      end     
      it 'nameが空では保存できない' do
      end
      it 'infoが空では保存できない' do
      end     
      it 'category_idが空では保存できない' do
      end
      it 'sales_status_idが空では保存できない' do
      end     
      it 'shipping_fee_status_idが空では保存できない' do
      end
      it 'prefecture_idが空では保存できない' do
      end     
      it 'scheduled_delivery_idが空では保存できない' do
      end
      it 'priceが空では保存できない' do
      end     
      it 'userが紐付いてなければ保存できない' do
      end
      it 'priceが半角数値でなければ保存できない' do
      end
      it 'priceが¥300~¥9,999,999の間のみでなければ保存できない' do
      end
    end
  end
end



                  
validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}          
validates :sales_status_id, numericality: { other_than: 1 , message: "can't be blank"}         
validates :shipping_fee_status_id, numericality: { other_than: 1 , message: "can't be blank"}   
validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}          
validates :scheduled_delivery_id, numericality: { other_than: 1 ,message: "can't be blank"}  
                
