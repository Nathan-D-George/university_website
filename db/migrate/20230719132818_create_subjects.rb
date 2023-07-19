class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.references :user, null: false, foreign_key: true
      t.references :qualification, null: false, foreign_key: true
      t.string :name
      t.integer :credits, default: 16
      t.boolean :completed, default: false
      t.integer :mark

    end
  end
end
