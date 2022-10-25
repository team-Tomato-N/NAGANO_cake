class Item < ApplicationRecord
    has_many :cart_items, dependent: :destroy
    belongs_to :genre
    has_many :order_details, dependent: :destroy
    has_many :orders, dependent: :destroy
    enum is_active: {販売中:true, 販売停止:false}
    validates :item_image, presence: true
    validates :name, presence: true
    validates :explanation, presence: true
    validates :genre_id, presence: true
    validates :not_tax_price, presence: true
    validates :is_active, presence: true
  def tax_price
    (not_tax_price* 1.1).floor
  end
  has_one_attached :item_image
  def get_item_image(width, height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    item_image.variant(resize_to_fill: [width, height], gravity: :center).processed
  end
end
