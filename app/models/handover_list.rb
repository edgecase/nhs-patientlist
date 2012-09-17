class HandoverList < ActiveRecord::Base
  has_many   :handovers
  belongs_to :team

  validates_presence_of :team_id, :shift_date

  attr_accessible :team_id, :shift_date
end
