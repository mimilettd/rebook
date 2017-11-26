require 'rails_helper'

feature "User visits category#index" do
  scenario "and can see all categories" do
    create_list(:category, 10)

    visit categories_path

    expect(page).to have_css(".cat-index", :count => 11)
  end
end
