class User < ApplicationRecord
  with_options presence: true do
  validates :nickname
  validates :email
  validates :password, length: { minimum: 6 }, format: { with: /\A[a-z0-9]+\z/i }
  validates :password_confirmation, length: { minimum: 6 }, format: { with: /\A[a-z0-9]+\z/i }
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_date, presence: true
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders


end
