class AddBookImgToBooks < ActiveRecord::Migration
  def change
    add_column :books, :book_img, :string
  end
end
