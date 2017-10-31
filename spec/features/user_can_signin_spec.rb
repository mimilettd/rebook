require 'rails_helper'

feature "User can signin" do
  scenario "without Oauth" do
    User.create(name: "Mimi Le", email: "mimi@rebook.com", password: "password")
    visit '/'

    click_on "Sign In"

    expect(current_path).to eq('/signin')

    fill_in "user[email]", with: "mimi@rebook.com"
    fill_in "user[password]", with: "password"

    click_button "Sign In"

    expect(current_path).to eq('/myaccount')
  end
end
