class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shopping_addresses, dependent: :destroy

  def active_for_authentication?
    super && (is_deleted == false)
  end

  has_many :cart_items,dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_furigana, presence: true
  validates :first_furigana, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
end
