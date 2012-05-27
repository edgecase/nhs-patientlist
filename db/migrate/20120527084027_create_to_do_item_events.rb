class CreateToDoItemEvents < ActiveRecord::Migration
  def change
    create_table :to_do_item_events do |t|
      t.references :to_do_item
      t.string     :event_name

      t.timestamps
    end
  end
end
