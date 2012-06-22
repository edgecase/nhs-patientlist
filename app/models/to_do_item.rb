class ToDoItem < ActiveRecord::Base
  audited

  attr_accessible :description, :patient_id, :status
  validates :status,
    inclusion: {in: %w{todo pending done} }
    # TODO: validate order of ops

end
