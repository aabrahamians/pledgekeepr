class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :role
      t.string :passwordDigest
      t.integer :quota

      t.timestamps
    end
  end
end
