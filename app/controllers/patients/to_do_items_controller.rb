module Patients

class ToDoItemsController < ApplicationController
  def create
    patient.to_do_items.create!(params[:to_do_item])
    redirect_to edit_patient_path(patient)
  end

  def update
    status = params[:commit] == 'Pending' ? 'pending' : 'done'
    to_do_item.update_attribute :status, status
    redirect_to edit_patient_path(patient)
  end

  expose(:patient)
  expose(:to_do_item)
end


end
