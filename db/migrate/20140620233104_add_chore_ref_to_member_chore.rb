class AddChoreRefToMemberChore < ActiveRecord::Migration
  def change
    add_reference :member_chores, :chore, index: true
  end
end
