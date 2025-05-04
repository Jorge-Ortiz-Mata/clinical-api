module DevPreparation
  class AppointmentCreator
    def initialize(patient_id:)
      @patient_id = patient_id
    end

    def call
      dates = DevPreparation::DateCreator.call

      dates.each do |date|
        appointment = patient.appointments.build(doctor: patient.doctor, start_time: date, duration_in_minutes: 50)
        appointment.save
      end
    end

    private

    def patient
      @patient ||= Patient.find(@patient_id)
    end
  end
end
