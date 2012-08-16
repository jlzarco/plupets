class ChangeTypeColumnName < ActiveRecord::Migration
  def change
    rename_column :pets, :type, :animal_type
  end
end
