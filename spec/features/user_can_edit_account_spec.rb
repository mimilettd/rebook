require 'rails_helper'

feature "As a registered user" do
  scenario "I can add my address" do

    User.create(name: "Mimi Le", email: "mimi@rebook.com", password: "password")

    visit '/'

    click_on "Sign In"

    fill_in "user[email]", with: "mimi@rebook.com"
    fill_in "user[password]", with: "password"

    click_button "Sign in"

    click_on "Hi, Mimi Le!"

    click_on "Account Details"

    expect(current_path).to eq("/myaccount")

    click_on "View account details"

    within(".address") do
      click_on "Edit"
    end

    fill_in "user[street_address]", with: "1313 Disneyland Dr"
    fill_in "user[city]", with: "Anaheim"
    fill_in "user[state]", with: "CA"
    fill_in "user[zip]", with: "92802"

    click_on "Save"

    expect(page).to have_content("Account successfully updated.")
    expect(current_path).to eq("/account/overview")
  end
end
