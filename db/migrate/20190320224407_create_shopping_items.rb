class CreateShoppingItems < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_items do |t|
      t.references :shopping, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
