# TODO: Seed the database according to the following requirements:
# - There should be 10 Doctors with unique names
# - Each doctor should have 10 patients with unique names
# - Each patient should have 10 appointments (5 in the past, 5 in the future)
#   - Each appointment should be 50 minutes in duration

DOCTORS_AMOUNT = 10
PATIENT_BY_DOCTOR_AMOUNT = 10

DevPreparation::Base.call(DOCTORS_AMOUNT, PATIENT_BY_DOCTOR_AMOUNT)
