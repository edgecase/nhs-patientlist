class AddGradeToUser < ActiveRecord::Migration
  def change
    add_column :users, :grade_id, :integer
  end
end
