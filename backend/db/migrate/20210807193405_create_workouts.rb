class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :title
      t.string :complete_by
      t.boolean :is_complete
      t.integer :trainer_id
      t.integer :client_id

      t.timestamps
    end
  end
end
