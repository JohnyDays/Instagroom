class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.belongs_to :user
      t.belongs_to :post

      t.timestamps
    end
    add_index :activities, :user_id
    add_index :activities, :post_id
  end
end
