class AddRaceToPets < ActiveRecord::Migration
  def change
    add_column :pets, :race, :string
  end
end
