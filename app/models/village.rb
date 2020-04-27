class Village < ApplicationRecord
  has_one :position, class_name: "Position"
  include Searchable


  def lng
    position.x
  end

  def lat
    position.y
  end
end
