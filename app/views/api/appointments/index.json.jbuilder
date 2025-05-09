json.data do
  json.metadata do
    json.rows @appointments.length
  end

  json.appointments @appointments, partial: "api/appointments/appointment", as: :appointment
end
