class CreateCustomPatientLists < ActiveRecord::Migration
  def change
    create_table :custom_patient_lists do |t|
      t.references :user
      t.string :name
      t.timestamps
    end
    create_table :members do |t|
      t.references :custom_patient_list
      t.references :patient
    end
  end
end
