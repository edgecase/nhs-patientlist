class RenamePatientListsPatientsToMemberships < ActiveRecord::Migration
  def change
    rename_table :patient_lists_patients, :memberships
  end
end
