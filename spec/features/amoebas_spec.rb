require 'rails_helper'

describe "Amoebas", :type => :feature do

  describe "index" do
    it "displays amoebas" do
      visit '/amoebas'
      expect(page).to have_content "Jahmil"
      expect(page).to have_content "Lavoisier"
      expect(page).to have_content "Logan"
    end
  end

  describe "show" do
    it "displays amoeba and it's acts" do
      amoeba = Amoeba.find(1)
      visit "/amoebas/#{amoeba.id}"
      expect(page).to have_content("#{amoeba.name}")
      expect(page).to have_content("#{amoeba.acts.first.name}")
    end
  end
end