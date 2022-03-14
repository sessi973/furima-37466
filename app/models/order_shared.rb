class OrderShared
  include ActiveModel::Model
  attr_accessor :user_id, :item, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :order

  with_options presence: true do
   validates :city
   validates :addresses
   validates :phone_number, format: {^0\d{10,11}$}
    #validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: 'is invalid'}
   validates :user_id
   validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
  validates :building
  def save
    # 各テーブルにデータを保存する処理を書く
 order = Order.create(item: item, user_id: user_id)
 # 住所を保存する
 Address.create(postal_code: postal_code, prefecture: prefecture, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order_id)
  end
end