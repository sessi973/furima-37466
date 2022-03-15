class OrderShared
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number

  with_options presence: true do
   validates :city
   validates :addresses
   validates :phone_number, format: { with: /\A\d{10,11}\z/ }
   validates :item_id
   validates :user_id
   
   validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  def save
    # 各テーブルにデータを保存する処理を書く
 order = Order.create(item_id: item_id, user_id: user_id)
 # 住所を保存する
 Shared.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order_id)
  end
end