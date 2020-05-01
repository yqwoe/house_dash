class CityPriceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :price, :time
  cache_options enabled: true, cache_length: 24.hours
end
