require 'rails_helper'

RSpec.feature "User can delete category" do

  context "unathorized user" do
    scenario "default user cannot delete categories" do
      category = Category.create(title: "Sports")

      user = User.create(username: "RegUser", email: "reguser@example.com", password: "password", role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit categories_path

      click_button "Delete Category"

      expect(page).to have_content("404")
    end
  end

  xcontext "authorized user" do
    scenario "successfully deletes a category" do
      Category.create(title: "Sports")

      user = User.create(username: "RegUser", email: "reguser@example.com", password: "password", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit categories_path

      expect(page).to have_content("Sports")

      click_button "Delete Category"

      expect(current_path).to eq(categories_path)

      expect(page).to_not have_content("Sports")
    end
  end
end
