class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.string :name
      t.integer :credits, default: 16
      t.boolean :completed, default: false
      t.integer :mark

    end
  end
end
