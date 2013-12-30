class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :role, :default => "customer"
      t.string :secure_token
      t.datetime :secure_token_expire
      t.string :contact
      t.integer :credit, :default => 0

      t.timestamps
    end
    add_index(:users, :secure_token)
  end
end
