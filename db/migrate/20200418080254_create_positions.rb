class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.string :x
      t.string :y
      t.string :v_id
      t.string :address
      t.string :city
      t.references :village, null: false, foreign_key: true

      t.timestamps
    end
    add_index :positions, :x
    add_index :positions, :y
    add_index :positions, :v_id
    add_index :positions, :address
    add_index :positions, :city
  end
end
