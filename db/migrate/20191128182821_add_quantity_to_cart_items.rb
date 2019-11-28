class AddQuantityToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_column :carts_items, :quantity, :integer, :default => true
  end
end
