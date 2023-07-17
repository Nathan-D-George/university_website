class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :student_no, default: 2000000000
      t.string :email
      t.string :password_digest
      t.integer :role, default: 0
      t.boolean :residence, default: false

      t.timestamps
    end
  end
end
