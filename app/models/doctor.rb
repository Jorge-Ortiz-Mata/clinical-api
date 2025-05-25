class Doctor < ApplicationRecord
  has_many :patients
  has_many :appointments

  validates :name, presence: true, uniqueness: true

  class << self
    def without_appointments
      where.not("exists (?)", Appointment.where('appointments.doctor_id = doctors.id'))
    end
  end
end
