class Brigade < ApplicationRecord
  has_many :brigade_memberships, dependent: :destroy
  has_many :students, through: :brigade_memberships
end
