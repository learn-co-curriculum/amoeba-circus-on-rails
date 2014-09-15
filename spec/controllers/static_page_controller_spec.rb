require 'rails_helper'

describe StaticPagesController do
  describe "home/root index" do
    it "displays welcome/home page" do
      get "home"

    end
  end
end
