class LaboratoryWork < ApplicationRecord
  mount_uploader :document, DocumentUploader # Tells rails to use this uploader for this model.
  validates :name, presence: true
end
