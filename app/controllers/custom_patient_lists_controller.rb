class CustomPatientListsController < ApplicationController

  expose(:user)
  expose(:user_patient_lists) { user.custom_patient_lists }
  expose(:custom_patient_lists) { current_user.custom_patient_lists }
  expose(:custom_patient_list)

  def index
  end

  def new
  end
  
  def create
    if custom_patient_list.save
      redirect_to :action => :index, :notice => "Successfully created new list"
    else
      render :new
    end
  end


end
