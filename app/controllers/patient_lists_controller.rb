class PatientListsController < ApplicationController
  expose(:wards){Admission.wards}
  expose(:ward){ params[:ward]}
  expose(:patients){ ward.nil? ? PatientDetail.admitted : PatientDetail.in_ward(ward)}

end
