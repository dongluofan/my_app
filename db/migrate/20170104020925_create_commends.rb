class CreateCommends < ActiveRecord::Migration
  def change
    create_table :commends do |t|
      t.string :content
      t.integer :user_id
      t.integer :micropost_id

      t.timestamps
    end
  end
end
