class House < ApplicationRecord
  belongs_to :village
  include Searchable
end
