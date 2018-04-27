class BrigadeMembership < ApplicationRecord
  belongs_to :student
  belongs_to :brigade
end
