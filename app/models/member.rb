class Member < ActiveRecord::Base
  belongs_to :custom_patient_list
  belongs_to :patient
end

