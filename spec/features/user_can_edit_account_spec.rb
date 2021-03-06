require 'rails_helper'

feature "As a registered user" do
  before(:each) do

    User.create(name: "Mimi Le", email: "mimi@rebook.com", password: "password")

    visit '/'

    click_on "Sign In"

    fill_in "user[email]", with: "mimi@rebook.com"
    fill_in "user[password]", with: "password"

    click_button "Sign in"

    click_on "Hi, Mimi Le!"

  end
  scenario "I can edit my name" do

    click_on "Account Details"

    expect(current_path).to eq("/myaccount")

    click_on "View account details"

    within(".edit-info") do
      click_on "Edit"
    end

    fill_in "user[name]", with: "Mimi Zotti"

    click_on "Done"

    expect(page).to have_content("Account successfully updated.")
    expect(page).to have_content("Mimi Zotti")
    expect(current_path).to eq(account_settings_path)
  end

  scenario "I can add my address" do

    click_on "Account Details"

    click_on "View account details"

    within(".edit-address") do
      click_on "Edit"
    end

    fill_in "user[street_address]", with: "1313 Disneyland Dr"
    fill_in "user[city]", with: "Anaheim"
    fill_in "user[state]", with: "CA"
    fill_in "user[zip]", with: "92802"

    click_on "Done"

    expect(page).to have_content("Account successfully updated.")
    expect(page).to have_content("1313 Disneyland Dr, Anaheim, CA 92802")
  end
end
