class MembershipsController < ApplicationController
  
  def create
    list = current_user.patient_lists.find(params[:membership][:patient_list])
    list.patients << Patient.find(params[:patient_id])
    redirect_to :back
  end

  def destroy
    membership = PatientListsPatients.where(patient_list_id: params[:patient_list_id]).where(patient_id: params[:patient_id]).last
    if membership.owner == current_user
      membership.destroy
      redirect_to :back
    else
      render :status => :unauthorized
    end
  end

end
