class RemoveCreatorIdFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :creator_id, :integer
  end
end
