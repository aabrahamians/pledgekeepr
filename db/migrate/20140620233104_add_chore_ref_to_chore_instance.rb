class AddChoreRefToChoreInstance < ActiveRecord::Migration
  def change
    add_reference :chore_instances, :chore, index: true
  end
end
