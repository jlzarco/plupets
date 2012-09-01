class AddDeletedAtToPet < ActiveRecord::Migration
  def change
    add_column :pets, :deleted_at, :time
  end
end
