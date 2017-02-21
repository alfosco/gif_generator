require 'rails_helper'

RSpec.feature "User can generate a gif" do

  context "unathorized user" do
    scenario "default user cannot make new gifs" do
    user = User.create(username: "RegUser", email: "reguser@example.com", password: "password", role: 0)

    visit new_gif_path

      expect(page).to have_content("404")
    end
  end

  context "authorized user" do
    scenario "successfully generates a gif" do

      user = User.create(username: "RegUser", email: "reguser@example.com", password: "password", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit gifs_path
      click_on "Add a Gif"

      fill_in "Title", with: "slam dunk"
      fill_in "Image path", with: "http://giphy.com/gifs/nba-l0MYMFnc1YYEi1a36"
      click_on "Generate Gif"

      expect(current_path).to eq(gifs_path)

      expect(page).to have_content("slam dunk")
    end
  end
end
