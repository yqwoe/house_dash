class ChangeLongTimeToProxyPools < ActiveRecord::Migration[6.0]
  
def up
    change_column :proxy_pools, :long_time, :decimal, :precision => 10, :scale => 8
  end
  def down
    change_column :proxy_pools, :long_time, :bigint
  end
end
