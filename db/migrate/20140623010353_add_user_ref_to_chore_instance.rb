class AddUserRefToChoreInstance < ActiveRecord::Migration
  def change
    add_reference :chore_instances, :user, index: true
  end
end
