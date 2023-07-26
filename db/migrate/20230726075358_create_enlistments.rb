class CreateEnlistments < ActiveRecord::Migration[7.0]
  def change
    create_table :enlistments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

    end
  end
end
