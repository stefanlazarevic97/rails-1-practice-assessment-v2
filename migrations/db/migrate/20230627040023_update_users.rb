class UpdateUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :email, :username
    remove_column :users, :bio
  end
end
