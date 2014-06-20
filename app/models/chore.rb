class Chore < ActiveRecord::Base

has_many :member_chores
belongs_to :group

end
