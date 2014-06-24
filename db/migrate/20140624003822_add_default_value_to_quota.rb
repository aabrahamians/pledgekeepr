class AddDefaultValueToQuota < ActiveRecord::Migration
  def change
    change_column :users, :quota, :integer, :default => 1000
  end
  
end
