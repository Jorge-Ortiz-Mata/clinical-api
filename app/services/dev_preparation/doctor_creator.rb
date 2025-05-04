module DevPreparation
  class DoctorCreator
    class << self
      def call
        doctor = Doctor.new(name: Faker::Name.name)

        if doctor.save
          10.times { DevPreparation::PatientCreator.new(doctor_id: doctor.id).call }
        end
      end
    end
  end
end
