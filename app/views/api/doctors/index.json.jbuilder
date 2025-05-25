json.data do
  json.metadata do
    json.rows @doctors.length
  end

  json.doctors @doctors, partial: "api/doctors/doctor", as: :doctor
end
