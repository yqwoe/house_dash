class AddLongTimeToProxyPools < ActiveRecord::Migration[6.0]
  def change
    add_column :proxy_pools, :long_time, :bigint
    add_index :proxy_pools, :long_time
  end
end
