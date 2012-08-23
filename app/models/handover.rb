class Handover < ActiveRecord::Base
  belongs_to :to_do_item
  belongs_to :handover_list
  belongs_to :grade
  belongs_to :team

  validates_presence_of :to_do_item_id, :grade_id, :team_id
  
  attr_accessible :to_do_item_id, :grade_id, :team_id, :shift_date

  def shift_date
    handover_list.shift_date
  end

  def shift_date=(date)
    self.handover_list = HandoverList.find_or_create_by_shift_date(date)
  end
end
