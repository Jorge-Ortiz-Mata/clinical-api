module Api
  class AppointmentsController < ApiController
    def index
      @appointments = AppointmentQuery::GetAppointmentsQuery.new(params).call
    end

    def create
      @create_appointment_form = CreateAppointmentForm.new(appointment_params)

      if @create_appointment_form.save
        render json: { appointment: "The appointment was created successfully" }, status: :created
      else
        render json: { errors: @create_appointment_form.errors }, status: :unprocessable_entity
      end
    end

    private

    def appointment_params
      params.require(:appointment).permit(:patient, :doctor, :start_time, :duration_in_minutes)
    end
  end
end
