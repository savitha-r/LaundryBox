class AddDefaultToOrder < ActiveRecord::Migration
  def change
  	change_column :orders, :cost, :decimal, :precision => 4, :scale => 2, :default => "0.00"
  	change_column :orders, :status, :string, :default => "Awaiting Collection"
  end
end
