class AddFailCountToProxyPools < ActiveRecord::Migration[6.0]
  def change
    add_column :proxy_pools, :fail_count, :integer
    add_index :proxy_pools, :fail_count
  end
end
