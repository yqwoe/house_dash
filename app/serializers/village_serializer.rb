class VillageSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :id, :lng, :lat,:name,:ave_price
  cache_options enabled: true, cache_length: 12.hours
end
