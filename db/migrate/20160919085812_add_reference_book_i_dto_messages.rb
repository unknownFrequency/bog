class AddReferenceBookIDtoMessages < ActiveRecord::Migration
  def change
    add_reference :messages, :book, index:true
  end
end
