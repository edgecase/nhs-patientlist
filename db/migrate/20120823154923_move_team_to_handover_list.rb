class MoveTeamToHandoverList < ActiveRecord::Migration
  def up
    remove_column :handovers, :team_id
    add_column    :handover_lists, :team_id, :integer
  end

  def down
    add_column :handovers, :team_id, :integer    
    remove_column    :handover_lists, :team_id
  end
end
