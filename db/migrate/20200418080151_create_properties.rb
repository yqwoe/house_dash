class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :tit
      t.string :jl
      t.string :desc
      t.references :village, null: false, foreign_key: true

      t.timestamps
    end
    add_index :properties, :tit
    add_index :properties, :jl
    add_index :properties, :desc
  end
end
