class PatientListsController < ApplicationController

  # user's own lists (create and update)
  expose(:own_patient_lists) { current_user.patient_lists }
  expose(:own_patient_list)

  # other users' public lists
  expose(:user)
  expose(:user_patient_lists) { user.patient_lists }
  expose(:user_patient_list)

  def new
  end
  
  def create
    if own_patient_list.save
      redirect_to :action => :index, :notice => "Successfully created new list"
    else
      render :new
    end
  end
  
  def update
    if own_patient_list.save
      redirect_to :action => :index, :notice => "Successfully updated list"
    else
      render :edit
    end
  end

  def add_user_to_list
  end
  
  def destroy
    own_patient_list.destroy
    redirect_to :action => :index, :notice => "Successfully removed list"
  end

end
