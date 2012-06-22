class AddStatusToToDoItem < ActiveRecord::Migration
  def change
    add_column :to_do_items, :status, :string, default: 'todo'
  end
end
