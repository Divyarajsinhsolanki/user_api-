class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :created_by, null: false, foreign_key:  { to_table: 'users' }
      t.string :commented_on_type
      t.integer :commented_on_id

      t.timestamps
    end
  end
end
