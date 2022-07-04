class AddActionTypeAndActionIdToVotes < ActiveRecord::Migration[7.0]
  def change
    add_column :votes, :action_type, :string
    add_column :votes, :action_id, :integer
  end
end
