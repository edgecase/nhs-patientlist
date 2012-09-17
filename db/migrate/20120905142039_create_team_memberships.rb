class CreateTeamMemberships < ActiveRecord::Migration
  def change
    create_table :team_memberships do |t|
      t.references :user
      t.references :team
      t.timestamps
    end
  end
end
