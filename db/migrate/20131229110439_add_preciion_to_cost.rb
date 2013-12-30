class AddPreciionToCost < ActiveRecord::Migration
  def change
  	change_column :orders, :cost, :decimal, :precision => 4, :scale => 2
  end
end
