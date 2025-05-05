module DevPreparation
  class DoctorCreator
    class << self
      def call(patients_amount)
        doctor = Doctor.new(name: Faker::Name.name)

        if doctor.save
          patients_amount.times { DevPreparation::PatientCreator.new(doctor_id: doctor.id).call }
        end
      end
    end
  end
end
