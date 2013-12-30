class AddPrecisionToItem < ActiveRecord::Migration
  def change
  	change_column :items, :cost, :decimal, :precision => 4, :scale => 2
  end
end
