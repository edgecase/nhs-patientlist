class Shift < ActiveRecord::Base
  attr_accessible :name
  
  def self.day
    find_by_name 'Day'
  end
  
  def self.on_call
    find_by_name 'On Call'
  end
end
