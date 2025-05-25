class CreateAppointmentForm < BaseForm
  attribute :patient,               :string
  attribute :doctor,                :string
  attribute :start_time,            :string
  attribute :duration_in_minutes,   :string

  validates :patient, :doctor, :start_time, :duration_in_minutes, presence: true

  def save
    return false if invalid?

    puts patient
    puts doctor
    puts start_time
    puts duration_in_minutes

    perform
  end

  private

  def perform
  end
end