class AddPrecisionToCategory < ActiveRecord::Migration
  def change
  	change_column :categories, :cost, :decimal, :precision => 4, :scale => 2
  	remove_column :items, :cost
  end
end
