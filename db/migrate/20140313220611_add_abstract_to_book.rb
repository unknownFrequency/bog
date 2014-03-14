class AddAbstractToBook < ActiveRecord::Migration
  def change
    add_column :books, :abstract, :string
  end
end
