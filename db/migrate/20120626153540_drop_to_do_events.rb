class DropToDoEvents < ActiveRecord::Migration
  def up
    drop_table :to_do_item_events
  end

  def down
    create_table :to_do_item_events do |t|
      t.references :to_do_item
      t.string     :event_name

      t.timestamps
    end
  end
end
