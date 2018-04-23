class Post < ApplicationRecord
  belongs_to :category
  validate: :titl, :content, :category_id, presense: true
end
