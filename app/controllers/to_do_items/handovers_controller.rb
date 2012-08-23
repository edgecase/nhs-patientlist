class ToDoItems::HandoversController < ApplicationController
  expose(:to_do_item) { ToDoItem.find(params[:to_do_item_id]) }
  expose(:patient)    { to_do_item.patient }
  expose(:handover)
  expose(:grade)

  def create
    if handover.save
      redirect_to edit_patient_path(patient), :notice => "Task handed over"
    else
      flash[:alert] = "Could not hand task over"
      render :new
    end
  end
end
