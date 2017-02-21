require 'rails_helper'

RSpec.feature "User can create category" do

  context "unathorized user" do
    scenario "default user cannot create new categories" do
      user = User.create(username: "RegUser", email: "reguser@example.com", password: "password", role: 0)

      visit new_category_path

      expect(page).to have_content("404")
    end
  end

  context "authorized user" do
    scenario "successfully creates a category" do

      user = User.create(username: "RegUser", email: "reguser@example.com", password: "password", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit categories_path
      click_on "Add a Category"

      fill_in "Title", with: "Sports"
      click_on "Create Category"

      expect(current_path).to eq(categories_path)

      expect(page).to have_content("Sports")
    end
  end
end
