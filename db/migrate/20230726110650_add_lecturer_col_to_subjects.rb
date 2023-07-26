class AddLecturerColToSubjects < ActiveRecord::Migration[7.0]
  def change
    add_column :subjects, :lecturer, :integer, default: 3023000000
  end
end
