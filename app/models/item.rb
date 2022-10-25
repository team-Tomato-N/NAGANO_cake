class Item < ApplicationRecord
    has_many :cart_items, dependent: :destroy
    has_many :order_details, dependent: :destroy
    has_many :orders, dependent: :destroy
     enum is_active: {販売中:0, 販売停止:1}
  def tax_price
    (not_tax_price* 1.1).floor
  end
  has_one_attached :item_image
  enum sale_status: { sale: 0, stop_sale: 1 }
  def get_item_image(width, height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    item_image.variant(resize_to_fill: [width, height], gravity: :center).processed
  end
end
