require 'spec_helper'

describe User do 
	describe 'data model relationships' do
	
	it { should have_many(:chore_instances)}
	it { should have_many(:chores)}
	it { should belong_to(:group_pledged)}
	it { should have_many(:groups_admined)}
	end

	describe 'testing columns' do
  it { should have_db_column(:name) }
  it { should have_db_column(:role)}
  it { should have_db_column(:phone)}
  it { should have_db_column(:quota)}
  it { should have_db_column(:password_digest)}

  end	
end

