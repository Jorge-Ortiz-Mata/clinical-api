json.id appointment.id
json.patient do
  json.name appointment.patient_name
end

appointment.patient_name
json.doctor do
  json.name appointment.doctor_name
  json.id appointment.doctor_id
end
json.created_at appointment.created_at_formatted
json.start_time appointment.start_time_formatted
json.duration_in_minutes appointment.duration_in_minutes