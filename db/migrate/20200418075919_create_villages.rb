class CreateVillages < ActiveRecord::Migration[6.0]
  def change
    create_table :villages do |t|
      t.string :name
      t.string :district
      t.string :comarea
      t.decimal :ave_price
      t.integer :age
      t.string :type_id
      t.string :count_id
      t.integer :building_count
      t.string :lh
      t.string :rj
      t.string :desc
      t.string :building_type
      t.string :wy_price
      t.string :wy
      t.string :tcw
      t.string :company
      t.string :v_id

      t.timestamps
    end
    add_index :villages, :name
    add_index :villages, :district
    add_index :villages, :comarea
    add_index :villages, :ave_price
    add_index :villages, :age
    add_index :villages, :type_id
    add_index :villages, :count_id
    add_index :villages, :building_count
    add_index :villages, :lh
    add_index :villages, :rj
    add_index :villages, :desc
    add_index :villages, :building_type
    add_index :villages, :wy_price
    add_index :villages, :wy
    add_index :villages, :tcw
    add_index :villages, :company
    add_index :villages, :v_id
  end
end
