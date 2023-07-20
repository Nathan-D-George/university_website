class CreateBags < ActiveRecord::Migration[7.0]
  def change
    create_table :bags do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.references :qualification, null: false, foreign_key: true
    end
  end
end
