class AreaPriceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :price, :time, :area_name
  cache_options enabled: true, cache_length: 24.hours
end
