require 'rails_helper'

feature "Membership" do
  scenario "User can see their membership" do
    user = User.create(name: "Ian Douglas", email: "ian@turing.io", password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/account/membership'

    expect(page).to have_content('You are on the trial subscription')
  end
end
