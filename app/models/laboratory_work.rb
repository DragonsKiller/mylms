class LaboratoryWork < ApplicationRecord
  mount_uploader :document, DocumentUploader # Tells rails to use this uploader for this model.
  validates :name, presence: true

  belongs_to :student
  belongs_to :academic_plan
  belongs_to :teacher
end
