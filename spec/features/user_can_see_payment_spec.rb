require 'rails_helper'

feature "Payment history" do
  scenario "User can see payment history" do
    user = User.create(name: "Ian Douglas", email: "ian@turing.io", password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/account/payment'

    expect(page).to have_content('Trialling')
  end
end
