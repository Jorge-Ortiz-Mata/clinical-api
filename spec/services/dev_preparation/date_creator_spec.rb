RSpec.describe DevPreparation::DateCreator, type: :service do
  describe "class methods" do
    context "#call" do
      it "returns 10 dates (5 before today and 5 after today)" do
        dates = described_class.call
        before_dates = dates[0..4]
        after_dates = dates[5..10]

        before_dates.each do |date|
          expect(date).to be < Date.today
        end

        after_dates.each do |date|
          expect(date).to be > Date.today
        end

        expect(dates.length).to eql 10
      end
    end

    context "#calculate_date" do
      it "returns a date before today based on the number and direction" do
        date = described_class.calculate_date("before", 5)
        days_difference =  Date.today.mjd - date.mjd

        expect(date).to be < Date.today
        expect(days_difference).to eql 5
      end

      it "returns a date after today based on the number and direction" do
        date = described_class.calculate_date("after", 9)
        days_difference =  date.mjd - Date.today.mjd

        expect(date).to be > Date.today
        expect(days_difference).to eql 9
      end
    end

    context "#set_dates" do
      it "returns specific amount of dates based on the direction provided (BEFORE)" do
        dates = described_class.set_dates("before", 3)

        dates.each do |date|
          expect(date).to be < Date.today
        end

        expect(dates.length).to eql 3
      end

      it "returns specific amount of dates based on the direction provided (AFTER)" do
        dates = described_class.set_dates("after", 8)

        dates.each do |date|
          expect(date).to be > Date.today
        end

        expect(dates.length).to eql 8
      end
    end
  end
end
