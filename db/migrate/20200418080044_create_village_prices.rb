class CreateVillagePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :village_prices do |t|
      t.decimal :price
      t.string :v_id
      t.references :village, null: false, foreign_key: true

      t.timestamps
    end
    add_index :village_prices, :price
    add_index :village_prices, :v_id
  end
end
