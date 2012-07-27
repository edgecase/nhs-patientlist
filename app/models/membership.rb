class Membership < ActiveRecord::Base
  belongs_to :patient_list
  belongs_to :patient
  
  def owner
    self.patient_list.user
  end

end

