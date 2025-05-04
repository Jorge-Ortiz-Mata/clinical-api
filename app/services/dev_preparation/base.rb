module DevPreparation
  class Base
    class << self
      def call
        10.times { DevPreparation::DoctorCreator.call }
      end
    end
  end
end
