class ToDoItem < ActiveRecord::Base
  audited

  belongs_to :patient
  belongs_to :handover

  attr_accessible :description, :patient_id, :status
  validates :status,
    inclusion: {in: %w{todo pending done} }
    # TODO: validate order of ops

  def creator
    self.audits.where(action:'create').last.user_id
  end

  def handed_over?
    Handover.where("to_do_item_id = ?", self.id).any?
  end
end
