class CreateHandoverLists < ActiveRecord::Migration
  def change
    create_table :handover_lists do |t|
      t.date :shift_date
      t.timestamps
    end
  end
end
