class PatientListsPatients < ActiveRecord::Base
  belongs_to :patient_list
  belongs_to :patient
end

