class CreateProxyPools < ActiveRecord::Migration[6.0]
  def change
    create_table :proxy_pools do |t|
      t.string :ip
      t.string :protocol
      t.integer :port
      t.integer :active
      t.string :source
      t.integer :check_count

      t.timestamps
    end
    add_index :proxy_pools, :ip
    add_index :proxy_pools, :protocol
    add_index :proxy_pools, :port
    add_index :proxy_pools, :active
    add_index :proxy_pools, :source
    add_index :proxy_pools, :check_count
  end
end
