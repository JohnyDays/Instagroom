class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :token
      t.has_many :posts

      t.timestamps
    end
  end
end
