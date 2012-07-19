class PatientsController < ApplicationController

  expose(:ward){ params[:ward] }
  expose(:wards){Admission.wards}
  expose(:patient)
  expose(:patients){ ward.nil? ? PatientDetail.admitted : PatientDetail.in_ward(ward)}
  
  def history
  end

  def show
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

  # membership operations:
  def add_to_list 
    list = current_user.patient_lists.find(params[:patient_lists_patients][:patient_list])
    list.patients << Patient.find(params[:patient_id])
  end

  def remove_from_list
    membership = PatientListsPatients.where(patient_list_id: params[:id]).where(patient_id: params[:patient_id])
    if membership.owner == current_user
      membership.destroy
    else
      render :status => :unauthorized
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
