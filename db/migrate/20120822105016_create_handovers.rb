class CreateHandovers < ActiveRecord::Migration
  def change
    create_table :handovers do |t|
      t.references :to_do_item
      t.references :handover_list

      t.timestamps
    end
    add_index :handovers, :to_do_item_id
    add_index :handovers, :handover_list_id
  end
end
