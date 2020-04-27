class SearchIndexer < ApplicationJob
  queue_as :search_indexer

  def perform(operation, type, id)
    p "type.downcase ===#{operation},#{type},#{id}"
    obj = nil

    case type.downcase
    when "areaprice"
      obj = AreaPrice.find_by_id(id)
    when "cityprice"
      obj = CityPrice.find_by_id(id)
    when "house"
      obj = House.find_by_id(id)
    when "position"
      obj = Position.find_by_id(id)
    when "property"
      obj = Property.find_by_id(id)
    when "village"
      obj = Village.find_by_id(id)
    when "villageprice"
      obj = VillagePrice.find_by_id(id)
    end

    return false unless obj

    if operation == "update"
      obj.__elasticsearch__.update_document
    elsif operation == "delete"
      obj.__elasticsearch__.delete_document
    elsif operation == "index"
      obj.__elasticsearch__.index_document
    end
  rescue => e
    p e
    raise e unless Rails.env.test?
  end
end