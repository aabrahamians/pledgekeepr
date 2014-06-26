require 'spec_helper'

describe ChoreInstance do 
	describe 'data model relationships' do
	
	it { should belong_to(:user)}
	it { should belong_to(:chore)}
	end

end