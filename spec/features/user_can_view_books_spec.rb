require 'rails_helper'

feature "User can view books" do
  scenario "by category" do
    category = Category.create(name: "Fiction")
    books = create_list(:book, 3, category: category)

    visit '/'

    click_on "Browse ReBook"

    click_on "Fiction"

    expect(current_path).to eq("/fiction")

    expect(page).to have_css(".book", count: 3)
  end
end
