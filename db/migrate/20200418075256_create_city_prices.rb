class CreateCityPrices < ActiveRecord::Migration[6.0]
  def change
    create_table :city_prices do |t|
      t.decimal :price

      t.timestamps
    end
  end
end
