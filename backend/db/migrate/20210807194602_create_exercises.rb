class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.integer :workout_id
      t.string :name
      t.integer :sets
      t.integer :reps
      t.integer :weight

      t.timestamps
    end
  end
end
