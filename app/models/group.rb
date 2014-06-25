class Group < ActiveRecord::Base

belongs_to :admin, :class_name => "User", :foreign_key => :user_id, :inverse_of => :groups_admined
has_many :pledges, :class_name => "User", :foreign_key => :group_id, :inverse_of => :group_pledged
has_many :chores


end
