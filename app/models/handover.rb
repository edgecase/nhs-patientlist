class Handover < ActiveRecord::Base
  belongs_to :to_do_item
  belongs_to :handover_list
  belongs_to :grade

  validates_presence_of :to_do_item_id, :grade_id
  
  attr_accessible :to_do_item_id, :grade_id
end
