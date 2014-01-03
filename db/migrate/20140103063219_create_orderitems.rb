class CreateOrderitems < ActiveRecord::Migration
  def change
    create_table :orderitems do |t|
      t.integer :order_id
      t.integer :item_id

      t.timestamps
    end
  end
end
