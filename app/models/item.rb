class Item < ApplicationRecord

  has_many :carts_items, foreign_key: 'item_id', dependent: :nullify
  has_many :carts, through: :carts_items, source: :carts_id
  has_many :orders_items, foreign_key: 'item_id'
  has_many :orders, through: :orders_items, source: :orders_id

  has_one_attached :item_image

  validates :title,
    presence: true

  validates :description,
    presence: true

  validates :price,
    presence: true

  validates :image_url,
    presence: true

end
