module Api
  class AppointmentsController < ApiController
    before_action :json_format

    def index
      # TODO: return all values
      # TODO: return filtered values

      @appointments = Appointment.all
    end

    def create
      # TODO:
    end
  end
end