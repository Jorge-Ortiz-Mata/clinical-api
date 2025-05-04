module DevPreparation
  class PatientCreator
    def initialize(doctor_id:)
      @doctor_id = doctor_id
    end

    def call
      patient = doctor.patients.build(name: Faker::Name.name)

      if patient.save
        DevPreparation::AppointmentCreator.new(patient_id: patient.id).call
      end
    end

    private

    def doctor
      @doctor ||= Doctor.find(@doctor_id)
    end
  end
end
