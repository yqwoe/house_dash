class Village < ApplicationRecord
  has_one :position, class_name: "Position"


  def lng
    position.x
  end

  def lat
    position.y
  end
end
