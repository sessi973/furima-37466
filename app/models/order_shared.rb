class OrderShared
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :order

  # ここにバリデーションの処理を書く

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end