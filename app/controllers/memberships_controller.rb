class MembershipsController < ApplicationController
  
  def create
    list = current_user.patient_lists.find(params[:membership][:patient_list])
    list.patients << Patient.find(params[:patient_id])
    redirect_to :back
  end

  def destroy
    membership = Membership.find_by_patient_list_id_and_patient_id params[:patient_list_id], params[:patient_id]
    if membership.owner == current_user
      membership.destroy
      redirect_to :back
    else
      render :status => :unauthorized
    end
  end

end
