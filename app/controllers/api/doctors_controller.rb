module Api
  class DoctorsController < ApiController
    before_action :json_format

    def index
      @doctors = Doctor.without_appointments
    end
  end
end
