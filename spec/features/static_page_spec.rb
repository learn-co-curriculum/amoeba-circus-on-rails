require 'rails_helper'

describe "Static Pages", :type => :feature do

  describe "there is a welcome landing page" do

    before(:each) do
      visit "/"
    end
    
    it "displays welcome" do
      expect(page).to have_content "Welcome to the Amoeba Circus"
    end

    it "displays link to amoebas index page" do
      expect(page).to have_link "See Amoebas"
    end

    it "displays link to acts index page" do
      expect(page).to have_content "See Acts"
    end

  end

end
