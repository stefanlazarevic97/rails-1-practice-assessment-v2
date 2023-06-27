class UpdateVideos < ActiveRecord::Migration[7.0]
  def change
    rename_column :videos, :name, :title
    add_index :videos, :uploader_id
    add_foreign_key :videos, :users, column: :uploader_id
  end
end
