class AddAreaNameToAreaPrices < ActiveRecord::Migration[6.0]
  def change
    add_column :area_prices, :area_name, :string
    add_index :area_prices, :area_name
  end
end
