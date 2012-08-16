class AddTypeToPets < ActiveRecord::Migration
  def change
    add_column :pets, :type, :int
  end
end
