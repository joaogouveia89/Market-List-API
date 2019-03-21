class ShoppingItem < ApplicationRecord
  belongs_to :shopping_id
  belongs_to :item_id
end
