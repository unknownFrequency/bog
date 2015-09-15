class Rename < ActiveRecord::Migration
  def change
    rename_column :photos, :itle, :title
  end
end
