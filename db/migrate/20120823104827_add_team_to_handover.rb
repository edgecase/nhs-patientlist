class AddTeamToHandover < ActiveRecord::Migration
  def change
    add_column :handovers, :team_id, :integer
  end
end
