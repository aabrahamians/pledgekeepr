class CreateChoreInstances < ActiveRecord::Migration
  def change
    create_table :chore_instances do |t|

      t.timestamps
    end
  end
end
