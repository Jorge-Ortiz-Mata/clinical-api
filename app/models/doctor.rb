class Doctor < ApplicationRecord
  has_many :patients
  has_many :appointments

  validates :name, presence: true, uniqueness: true
end
