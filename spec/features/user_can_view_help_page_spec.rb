require 'rails_helper'

feature "User visits help page" do
  scenario "and sees a new to rebook? box" do
    visit '/'

    click_on "Help"

    expect(current_path).to eq("/help")

    within(".new") do
      expect(page).to have_content("New to ReBook?")
      expect(page).to have_button("Learn more")
    end
  end
end
