module AppointmentQuery
  class GetAppointmentsQuery < BaseAppointmentQuery
    include FilterAppointments

    def initialize(options = {})
      @from = options.dig(:from) || "false"
      @page = options.dig(:page) || 1
      @length = options.dig(:length) || DEFAULT_PAGE
    end
    
    def call
      Appointment
        .extending(FilterAppointments)
        .with_doctors_and_patients
        .filter_by_from(@from)
        .apply_pagination(@page, @length)
    end
  end
end