RSpec.describe DevPreparation::PatientCreator, type: :service do
  let(:doctor) { FactoryBot.create(:doctor) }
  let(:klazz) { described_class.new(doctor_id: doctor.id) }

  context "public methods" do
    describe "#call" do
      it "creates a patient with 10 appointments" do
        expect{ klazz.call }.to change { Patient.count }.by(1)
        expect(Appointment.all.length).to eql 10
      end
    end
  end
end
