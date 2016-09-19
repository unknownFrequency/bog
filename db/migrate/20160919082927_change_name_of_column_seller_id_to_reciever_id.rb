class ChangeNameOfColumnSellerIdToRecieverId < ActiveRecord::Migration
  def change
    rename_column :messages, :seller_id, :reciever_id
  end
end
