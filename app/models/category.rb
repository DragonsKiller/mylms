class Category < ApplicationRecord
  has_many :line_items, inverse_of: :order
end
