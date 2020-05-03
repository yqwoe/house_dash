require 'redis'
# redis服务运行在本机
$redis = Redis.new(:host => 'localhost',:port=>6379)