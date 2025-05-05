RSpec.describe DevPreparation::DoctorCreator, type: :service do
  let(:patients_amount) { 3 }

  context "class methods" do
    describe "#call" do
      it "creates the a doctor with patients using the patients_amount value" do
        expect { described_class.call(patients_amount) }.to change { Doctor.count }.by(1)

        expect(Patient.all.length).to eql(patients_amount)
        expect(Appointment.all.length).to eql(patients_amount * 10)
      end
    end
  end
end
