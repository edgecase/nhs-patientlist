class AddNotNullConstraintsToTeams < ActiveRecord::Migration
  Team.where(:name => nil).update_all :name => 'unnamed team'
  Team.where(:shift_id => nil).update_all :shift_id => 0
  def up
      change_column :teams, :name, :string, :null => false
      change_column :teams, :shift_id, :string, :null => false
  end
  def down
    change_table :teams do |t|
      change_column :teams, :name, :string, :null => true
      change_column :teams, :shift_id, :string, :null => true
    end
  end
end
