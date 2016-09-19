class AddColumnSellerIdToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :seller_id, :integer
  end
end
