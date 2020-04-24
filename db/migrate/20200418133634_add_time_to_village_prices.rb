class AddTimeToVillagePrices < ActiveRecord::Migration[6.0]
  def change
    add_column :village_prices, :time, :date
    add_index :village_prices, :time
  end
end
