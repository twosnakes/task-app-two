class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.integer :project_id
      t.date :deadline

      t.timestamps
    end
  end
end
