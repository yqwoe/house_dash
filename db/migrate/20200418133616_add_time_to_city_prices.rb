class AddTimeToCityPrices < ActiveRecord::Migration[6.0]
  def change
    add_column :city_prices, :time, :date
    add_index :city_prices, :time
  end
end
