class CreateMarketLists < ActiveRecord::Migration[5.2]
  def change
    create_table :market_lists do |t|
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
