class CreateBookPhotos < ActiveRecord::Migration
  def change
    create_table :book_photos do |t|
      t.string :photo
      t.integer :user_id

      t.timestamps
    end
  end
end
