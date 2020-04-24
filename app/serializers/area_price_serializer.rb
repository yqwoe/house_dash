class AreaPriceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :price, :time, :area_name
end
