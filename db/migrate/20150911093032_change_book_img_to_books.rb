class ChangeBookImgToBooks < ActiveRecord::Migration
  def change
    change_column :books, :book_img, :json
  end
end
