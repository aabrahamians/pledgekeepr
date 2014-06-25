class Chore < ActiveRecord::Base

has_many :chore_instances
belongs_to :group

end
