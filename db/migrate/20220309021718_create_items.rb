class CreateItems < ActiveRecord::Migration[6.0]
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :sales_status, :shipping_fee_status, :prefecture, :scheduled_delivery  
  def change
    create_table :items do |t|
      t.string  :name,                    null: false
      t.text    :info,                    null: false 
      t.integer :category_id,             null: false
      t.integer :sales_status_id,         null: false
      t.integer :shipping_fee_status_id,  null: false
      t.integer :prefecture_id,           null: false
      t.integer :scheduled_delivery_id,   null: false
      t.integer :price,                   null: false
      t.references :user,                 null: false, foreign_key: true
    end
  end
end

