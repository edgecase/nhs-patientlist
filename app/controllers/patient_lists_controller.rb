class PatientListsController < ApplicationController

  expose(:user)
  expose(:user_patient_lists) { user.patient_lists }
  expose(:patient_lists) { current_user.patient_lists }
  expose(:patient_list)

  def index
  end

  def new
  end
  
  def create
    if patient_list.save
      redirect_to :action => :index, :notice => "Successfully created new list"
    else
      render :new
    end
  end


end
