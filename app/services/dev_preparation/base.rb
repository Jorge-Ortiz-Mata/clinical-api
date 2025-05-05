module DevPreparation
  class Base
    class << self
      def call(doctors_amount, patients_amount)
        doctors_amount.times { DevPreparation::DoctorCreator.call(patients_amount) }
      end
    end
  end
end
