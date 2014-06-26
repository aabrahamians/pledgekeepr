require 'spec_helper'

describe Chore do 
	describe 'data model relationships' do
	
	it { should have_many(:chore_instances)}
	it { should belong_to(:group)}
	end

	describe 'testing columns' do
  it { should have_db_column(:name) }
  it { should have_db_column(:description)}
  it { should have_db_column(:points).
      of_type(:integer)}
  end	
end

