require 'rails_helper'

describe "Acts", :type => :feature do

  describe "index" do
    it "displays acts" do
      visit '/acts'
      expect(page).to have_content "Monty Python's Flying Circus"
      expect(page).to have_content "Synchronized Swimming"
    end
  end

  describe "show" do
    it "displays act and it's performing amoebas" do
      amoeba = Amoeba.find(1)
      act = amoeba.acts.first
      visit "/acts/#{act.id}"
      expect(page).to have_content("#{act.name}")
      expect(page).to have_content("#{amoeba.name}")
    end
  end

end
