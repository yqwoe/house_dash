class AddTypeIdToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :type_id, :string
    add_index :properties, :type_id
  end
end
