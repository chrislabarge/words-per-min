if ENV['BROWSER']
  require 'spec_helper'

  describe 'sample integration test', type: :feature do
    it 'should load the page' do
      visit '/'

      expect(page).to have_content('words-per-min')
    end
  end
  
  describe 'variable tests', type: :feature  do
  	it 'should contain variables' do
  		hi = MainController.new
  		
  		expect(hi.sup).to eq(5) #this is to see if I can access the controller values.
  		
  	end
  end

end

