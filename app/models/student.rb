class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :subgroup
  has_many :brigade_memberships, dependent: :destroy
  has_many :brigades, through: :brigade_memberships
end
