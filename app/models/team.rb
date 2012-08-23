class Team < ActiveRecord::Base
  belongs_to :shift

  attr_accessible :shift_id, :name
  
  validates_presence_of   :shift_id
  validates_presence_of   :name 
  validates_uniqueness_of :name, :scope =>[:shift_id, :name]
end
