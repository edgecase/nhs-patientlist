class Team < ActiveRecord::Base
  belongs_to :shift
  has_many   :team_memberships

  attr_accessible :shift_id, :name

  validates_presence_of   :shift_id
  validates_presence_of   :name
  validates_uniqueness_of :name, :scope =>[:shift_id, :name]

  def self.on_call
    where "shift_id = ?", Shift.on_call.id
  end
end
