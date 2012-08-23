class Handover < ActiveRecord::Base
  belongs_to :to_do_item
  belongs_to :handover_list
  belongs_to :grade
  belongs_to :team

  attr_accessible :grade_id, :team_id
end
