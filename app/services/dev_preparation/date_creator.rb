module DevPreparation
  class DateCreator
    AFTER = "after".freeze
    BEFORE = "before".freeze
    DATES_AMOUNT = 5

    class << self
      def call
        before_dates = set_dates(BEFORE, DATES_AMOUNT)
        after_dates = set_dates(AFTER, DATES_AMOUNT)

        before_dates + after_dates
      end

      def set_dates(direction, quantity)
        dates = []

        quantity.times do
          number = rand(30..180)
          dates << calculate_date(number, direction)
        end

        dates
      end

      def calculate_date(number, direction)
        return Date.today - number.days if direction == BEFORE

        Date.today + number.days
      end
    end
  end
end
