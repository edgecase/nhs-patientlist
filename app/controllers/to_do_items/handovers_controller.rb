class ToDoItems::HandoversController < ApplicationController
  expose(:to_do_item) { ToDoItem.find(params[:to_do_item_id]) }
  expose(:patient)    { to_do_item.patient }
  expose(:handover)
  expose(:grade)

  def create
    handover.handover_list = HandoverList.new(:shift_date => params[:shift_date])
    handover.save
    redirect_to edit_patient_path(patient), :notice => "Task handed over"
  end
end
