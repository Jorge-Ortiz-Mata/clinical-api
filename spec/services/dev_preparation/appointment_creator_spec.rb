RSpec.describe DevPreparation::AppointmentCreator, type: :service do
  let(:patient) { FactoryBot.create(:patient) }
  let(:klazz) { described_class.new(patient_id: patient.id) }

  context "public methods" do
    describe "#call" do
      it "creates 10 appointments for the patient" do
        expect { klazz.call }.to change { Appointment.count }.by(10)
      end

      it "creates 5 appointments before today date" do
        klazz.call
        appointments = patient.appointments.where("start_time < ?", Date.today)

        appointments.each do |appointment|
          expect(appointment.start_time).to be < Date.today
          expect(appointment.duration_in_minutes).to eql 50
        end

        expect(appointments.length).to eql 5
        expect(patient.appointments.length).to eql 10
      end

      it "creates 5 appointments after today date" do
        klazz.call
        appointments = patient.appointments.where("start_time > ?", Date.today)

        appointments.each do |appointment|
          expect(appointment.start_time).to be > Date.today
          expect(appointment.duration_in_minutes).to eql 50
        end

        expect(appointments.length).to eql 5
        expect(patient.appointments.length).to eql 10
      end
    end
  end
end
