class Position < ApplicationRecord
  belongs_to :village
  include Searchable
end
