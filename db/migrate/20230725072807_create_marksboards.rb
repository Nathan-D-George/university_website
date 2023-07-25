class CreateMarksboards < ActiveRecord::Migration[7.0]
  def change
    create_table :marksboards do |t|
      t.references :user, null: false, foreign_key: true
      t.references :assessment, null: false, foreign_key: true

    end
  end
end
