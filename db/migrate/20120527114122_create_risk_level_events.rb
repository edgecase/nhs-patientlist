class CreateRiskLevelEvents < ActiveRecord::Migration
  def change
    create_table :risk_level_events do |t|
      t.references :patient
      t.string     :risk_level

      t.timestamps
    end
  end
end
