require 'spec_helper'

describe Group do 
	describe 'data model relationships' do
	
	it { should have_many(:users)}
	it { should have_many(:chores)}
	end



	describe 'testing columns' do
  it { should have_db_column(:name) }
  
  end	
end