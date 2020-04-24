class CreateHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :houses do |t|
      t.string :v_id
      t.string :area
      t.string :feature
      t.string :title
      t.string :xiaoqu_
      t.string :room
      t.decimal :total_price
      t.string :price
      t.string :louceng
      t.string :louxing
      t.string :chaoxiang
      t.string :zhuangxiu
      t.string :age
      t.string :quyu
      t.string :shoufu
      t.string :xiaoqu
      t.references :village, null: false, foreign_key: true

      t.timestamps
    end
    add_index :houses, :v_id
    add_index :houses, :area
    add_index :houses, :feature
    add_index :houses, :title
    add_index :houses, :xiaoqu_
    add_index :houses, :room
    add_index :houses, :total_price
    add_index :houses, :price
    add_index :houses, :louceng
    add_index :houses, :louxing
    add_index :houses, :chaoxiang
    add_index :houses, :zhuangxiu
    add_index :houses, :age
    add_index :houses, :quyu
    add_index :houses, :shoufu
    add_index :houses, :xiaoqu
  end
end
