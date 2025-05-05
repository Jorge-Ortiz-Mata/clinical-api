RSpec.describe DevPreparation::Base, type: :service do
  let(:doctors_amount) { 2 }
  let(:patients_amount) { 4 }

  context "class methods" do
    describe "#call" do
      it "creates doctors according to the quatity value with the patients and appointments" do
        expect { described_class.call(doctors_amount, patients_amount) }.to change { Doctor.count }.by(doctors_amount)

        expect(Patient.all.length).to eql(doctors_amount * patients_amount)
        expect(Appointment.all.length).to eql(doctors_amount * patients_amount * 10)
      end
    end
  end
end
