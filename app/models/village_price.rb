class VillagePrice < ApplicationRecord
  belongs_to :village
  include Searchable
end
