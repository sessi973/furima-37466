class Order < ApplicationRecord
  belongs to :order
  belongs to :item
  has_one :shared
end
