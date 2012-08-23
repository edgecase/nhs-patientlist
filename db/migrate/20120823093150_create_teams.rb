class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.references :shift
      t.string :name
      
      t.timestamps
    end
    add_index :teams, [:shift_id, :name], :unique => true
    add_index :teams, :shift_id
  end
end
