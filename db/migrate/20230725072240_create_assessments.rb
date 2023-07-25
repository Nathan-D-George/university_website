class CreateAssessments < ActiveRecord::Migration[7.0]
  def change
    create_table :assessments do |t|
      t.string :name
      t.integer :assess_type, default: 0
      t.integer :mark, default: 10
      t.integer :total, default: 10
      t.references :subject, null: false, foreign_key: true

    end
  end
end
