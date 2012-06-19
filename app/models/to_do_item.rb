class ToDoItem < ActiveRecord::Base
  attr_accessor :to_do_state, :owner
  attr_accessible :description, :patient_id, :to_do_state, :owner
  has_many :to_do_item_events, :order=>"id ASC"

  before_create do
    to_do_item_events.build(:event_name => @to_do_state, :user => @owner)
  end

  def state
    to_do_item_events.last.event_name
  end

  def make_event(event_name, user)
    to_do_item_events.create!(:event_name=>event_name, :user => user)
  end
end
