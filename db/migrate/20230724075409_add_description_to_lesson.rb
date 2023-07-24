class AddDescriptionToLesson < ActiveRecord::Migration[7.0]
  def change
     add_column :lessons, :description, :text, default: "Subject's description"
  end
end
