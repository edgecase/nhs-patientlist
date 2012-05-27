class ToDoItem < ActiveRecord::Base
  attr_accessible :description, :patient_id
  has_many :to_do_item_events, :order=>"id ASC"

  before_create do
    to_do_item_events.build(:event_name=>'todo')
  end

  def state
    to_do_item_events.last.event_name
  end

  def make_event event_name
    to_do_item_events.create!(:event_name=>event_name)
  end
end
