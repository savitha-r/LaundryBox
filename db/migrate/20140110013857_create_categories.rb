class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.decimal :cost

      t.timestamps
    end
  end
end
