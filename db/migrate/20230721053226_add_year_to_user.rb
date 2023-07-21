class AddYearToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :year_of_study, :integer, default: 1
    add_column :subjects, :year, :integer, default: 1
    add_column :subjects, :semester, :integer, default: 1
  end
end
