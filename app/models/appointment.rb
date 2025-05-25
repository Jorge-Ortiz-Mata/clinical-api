class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  def patient_name
    patient.name
  end

  def doctor_id
    doctor.id
  end

  def doctor_name
    doctor.name
  end

  def start_time_formatted
    start_time.iso8601(9)
  end

  def created_at_formatted
    created_at.iso8601(9)
  end
end
