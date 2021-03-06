require 'rails_helper'

feature "User can signout" do
  scenario "by clicking Sign Out" do
    user = User.create(name: "Mimi Le", email: "mimi@rebook.com", password: "password")

    visit '/'

    click_on "Sign In"

    expect(current_path).to eq('/signin')

    fill_in "user[email]", with: "mimi@rebook.com"
    fill_in "user[password]", with: "password"

    click_button "Sign in"

    click_on "Hi, Mimi Le!"

    click_on "Not Mimi Le? Sign out"

    expect(current_path).to eq('/')
    expect(page).to have_content("Sign In")
  end
end
