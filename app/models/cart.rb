class Cart < ApplicationRecord

  belongs_to :user, optional: true
  has_many :carts_items, foreign_key: 'cart_id', dependent: :destroy
  has_many :items, through: :carts_items, source: :items_id
  
  def add_product(product)
    item = carts_items.find_by(item_id: product)
  
    if item
      item.quantity += 1
    else
      item = carts_items.new(item: product )
    end
  
    item
  end

  def total
    carts_items.to_a.sum(&:total)
  end
  
end
