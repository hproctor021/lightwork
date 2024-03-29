class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :is_trainer
      t.string :phone
      t.string :image

      t.timestamps
    end
  end
end
