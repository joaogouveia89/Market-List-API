class CreateShoppings < ActiveRecord::Migration[5.2]
  def change
    create_table :shoppings do |t|
      t.date :date
      t.references :market_id
      t.float :total

      t.timestamps
    end
  end
end
