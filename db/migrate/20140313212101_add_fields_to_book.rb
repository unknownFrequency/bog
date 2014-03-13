class AddFieldsToBook < ActiveRecord::Migration
  def change
    add_column :books, :genre, :string
    add_column :books, :published_on, :date
  end
end
