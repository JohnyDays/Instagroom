class AddFollowerLogicToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :source_id, :integer
    add_column :posts, :source_post_id, :integer
    add_column :posts, :from_post_id, :integer
  end

end
