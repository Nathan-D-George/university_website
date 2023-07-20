class CreateQualifications < ActiveRecord::Migration[7.0]
  def change
    create_table :qualifications do |t|
      t.string :name
      t.integer :credits_total
      t.integer :credits_completed, default: 0
    end
  end
end
