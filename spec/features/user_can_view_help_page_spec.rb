require 'rails_helper'

feature "User visits help page" do
  scenario "and sees a new to rebook? box" do
    visit '/'

    click_on "Help"

    expect(current_path).to eq("/help")

    expect(page).to have_content("New to ReBook?")
    expect(page).to have_button("Learn more")
  end

  scenario "and sees a return your book box" do
    visit '/'

    click_on "Help"

    expect(page).to have_content("Return Your Book")
    expect(page).to have_button("Return book")
  end

  scenario "and sees a cancel your subscription box" do
    visit '/'

    click_on "Help"

    expect(page).to have_content("Cancel Your Subscription")
    expect(page).to have_button("Cancel subscription")
  end
end
