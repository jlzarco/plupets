class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :user_id
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
