class AddUserRefToMemberChore < ActiveRecord::Migration
  def change
    add_reference :member_chores, :user, index: true
  end
end
