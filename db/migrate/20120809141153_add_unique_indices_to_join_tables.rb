class AddUniqueIndicesToJoinTables < ActiveRecord::Migration
  def change
    add_index :patient_lists, [:name, :user_id], unique: true 
    add_index :memberships, [:patient_list_id, :patient_id], unique: true
  end
end
