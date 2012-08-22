class AddGradeToHandover < ActiveRecord::Migration
  def change
    add_column :handovers, :grade_id, :integer
  end
end
