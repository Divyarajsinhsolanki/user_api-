class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.integer :user_like_id
      t.integer :liked_id
      t.string :liked_type

      t.timestamps
    end
  end
end
