class AddUserReferenceToToDoItemEvents < ActiveRecord::Migration
  def change
    add_column :to_do_item_events, :user_id, :integer
  end
end
