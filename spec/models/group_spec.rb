require 'spec_helper'

describe Group do 
	before { @group = Group.new(name: "test")}

	subject { @group }
	it { should respond_to(:name) }

	describe 'data model relationships' do
	
	it { should have_many(:pledges)}
	it { should have_many(:chores)}
	it { should belong_to(:admin)}
	end



	describe 'testing columns' do
  it { should have_db_column(:name) }
  
  end	
end