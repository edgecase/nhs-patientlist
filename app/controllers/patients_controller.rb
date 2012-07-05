class PatientsController < ApplicationController

  expose(:ward){ params[:ward] }
  expose(:wards){Admission.wards}
  expose(:patient)
  expose(:patients){ ward.nil? ? PatientDetail.admitted : PatientDetail.in_ward(ward)}
  
  def history
  end

  def update_risk_level
    @patient = Patient.find(params[:id])
    @result = (@patient.risk_level = params[:risk_level])
    respond_to do |format|
      if @result
        format.html { redirect_to :back, :notice => 'Risk level updated' }
      else
        format.html { redirect_to :back, :notice => "The risk level wasn't saved. Please try again." }
      end
      format.js
    end
  end

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
