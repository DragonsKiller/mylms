class Group < ApplicationRecord
  has_many :subgroups, dependent: :destroy
end
