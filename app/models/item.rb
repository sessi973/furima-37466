class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions  
has_one    :order
belongs_to :user 
belongs_to :category 
belongs_to :sales_status
belongs_to :shipping_fee_status
belongs_to :prefecture
belongs_to :scheduled_delivery 
has_one_attached :image

validates :image, presence: true
validates :name, presence: true
validates :info, presence: true                   
validates :category_id, presence: true, numericality: { other_than: 1 }          
validates :sales_status_id, presence: true, numericality: { other_than: 1 }         
validates :shipping_fee_status_id, presence: true, numericality: { other_than: 1 }   
validates :prefecture_id, presence: true, numericality: { other_than: 1 }          
validates :scheduled_delivery_id, presence: true, numericality: { other_than: 1 }  
validates :price, presence: true                   
validates :user, presence: true


end
