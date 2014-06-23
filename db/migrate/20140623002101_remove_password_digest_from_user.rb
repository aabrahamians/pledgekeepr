class RemovePasswordDigestFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :passwordDigest, :string
  end
end
