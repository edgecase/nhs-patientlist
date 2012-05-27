require 'csv'
class PatientListsController < ApplicationController
  expose(:wards){Admission.wards}
  expose(:ward){ params[:ward]}
  expose(:patients){ ward.nil? ? PatientDetail.admitted : PatientDetail.in_ward(ward)}

  def current
    session[:ward] = ward
    respond_to do |fmt|
      fmt.csv {render :text=>patient_csv, :content_type => 'application/csv'}
      fmt.html
    end
  end


  private
  def patient_csv
    CSV.generate do |csv|
      csv << %w(ward name sex hospno dob pmh allergies pending todo)
      patients.each do |pt|
        csv << [pt.ward, pt.name, pt.sex, pt.hospno, pt.birthdate, pt.pmh, pt.allergies, pt.to_dos.map(&:description) * ",", pt.pendings.map(&:description) * ","]
      end
    end
  end

end
