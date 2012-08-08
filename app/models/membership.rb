class Membership < ActiveRecord::Base
  belongs_to :patient_list
  belongs_to :patient
  
  validates :patient_id, :patient_list_id, :presence => true
  validates :patient_id, :uniqueness => {:scope => :patient_list_id, :message => "must be unique"}
  def owner
    self.patient_list.user
  end

end

