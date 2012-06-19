class ToDoItemEvent < ActiveRecord::Base
  attr_accessible :event_name, :user
  belongs_to :to_do_item
  belongs_to :user

  before_create do
    self.event_name ||= 'todo'
  end
end
