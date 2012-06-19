class ToDoItemsController < ApplicationController
  def create
    patient.to_do_items.create!(params[:to_do_item])
    redirect_to edit_patient_path(patient)
  end

  def add_event
    next_event = params[:commit] == 'Pending' ? 'pending' : 'done'
    to_do_item.make_event(next_event, current_user)
    redirect_to edit_patient_path(patient)
  end

  expose(:patient)
  expose(:to_do_item)
end
