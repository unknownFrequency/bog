class RenameUserIdToBookId < ActiveRecord::Migration
  def change
    rename_column :book_photos, :user_id, :book_id
  end
end
