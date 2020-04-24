class CityPriceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :price, :time
end
