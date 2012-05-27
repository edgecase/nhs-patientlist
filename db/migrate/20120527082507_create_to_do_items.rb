class CreateToDoItems < ActiveRecord::Migration
  def change
    create_table :to_do_items do |t|
      t.references :patient
      t.string     :description

      t.timestamps
    end
  end
end
