class ProxyPoolSerializer
  include FastJsonapi::ObjectSerializer

  attributes :ip, :port,:active,:check_count,:fail_count,:protocol,:long_time
  cache_options enabled: true, cache_length: 12.hours
end
