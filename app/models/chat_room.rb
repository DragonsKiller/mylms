class ChatRoom < ApplicationRecord
  belongs_to :student
  has_many :messages, dependent: :destroy
end
