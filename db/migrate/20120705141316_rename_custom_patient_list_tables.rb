class RenameCustomPatientListTables < ActiveRecord::Migration
  def change
    rename_table :custom_patient_lists, :patient_lists
    rename_table :members, :patient_lists_patients
    rename_column :patient_lists_patients, :custom_patient_list_id, :patient_list_id
  end
end
