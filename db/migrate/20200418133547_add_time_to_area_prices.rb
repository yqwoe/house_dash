class AddTimeToAreaPrices < ActiveRecord::Migration[6.0]
  def change
    add_column :area_prices, :time, :date
    add_index :area_prices, :time
  end
end
