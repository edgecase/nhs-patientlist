class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :title

      t.timestamps
    end
  end
end
