class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.string :name, default: 'Lesson #'
      t.references :subject, null: false, foreign_key: true

    end
  end
end
