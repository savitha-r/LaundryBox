class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.decimal :cost
    	t.string :status
    	t.text :special_message
    	t.integer :user_id
    	t.timestamps
    end
  end
end
