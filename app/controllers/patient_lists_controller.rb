class PatientListsController < ApplicationController
  expose(:wards){Admission.wards}
  expose(:ward){ params[:ward]}
  expose(:patients){ ward.nil? ? PatientDetail.admissions : PatientDetail.in_ward(ward)}

end
