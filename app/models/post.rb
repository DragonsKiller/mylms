class Post < ApplicationRecord
  belongs_to :category
  validates_presence_of :title, :content, :category_id
  has_many :line_items, inverse_of: :order
end
