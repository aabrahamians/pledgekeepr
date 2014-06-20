class CreateMemberChores < ActiveRecord::Migration
  def change
    create_table :member_chores do |t|

      t.timestamps
    end
  end
end
