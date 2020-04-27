class Property < ApplicationRecord
  belongs_to :village
  include Searchable
  include Searchable
end
