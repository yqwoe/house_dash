# 这里的地址和端口号(1643)都需要配置成正确的
Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379/12' } #标准格式 config.redis = { url: "redis://#{redis_server}:#{redis_port}/#{redis_db_num}", namespace: redis_namespace }
end
Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379/12' } #标准格式 config.redis = { url: "redis://#{redis_server}:#{redis_port}/#{redis_db_num}", namespace: redis_namespace }
end