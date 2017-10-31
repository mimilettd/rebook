require 'rails_helper'

feature "User can create an account" do
  scenario "without Oauth" do
    visit '/'

    click_on "Sign In"

    expect(current_path).to eq('/signin')

    click_on "Register"

    expect(current_path).to eq('/newaccount')

    fill_in "Your name", with: "Mimi Le"
    fill_in "Email", with: "mimi@rebook.com"
    fill_in "Password", with: "password"
    fill_in "Re-enter password", with: "password"

    click_on "Create your ReBook account"

    expect(current_path).to eq('/myaccount')
  end
end
