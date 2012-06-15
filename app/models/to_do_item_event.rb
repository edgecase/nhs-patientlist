class ToDoItemEvent < ActiveRecord::Base
  attr_accessible :event_name
  belongs_to :to_do_item

  before_create do
    self.event_name ||= 'todo'
  end
end
