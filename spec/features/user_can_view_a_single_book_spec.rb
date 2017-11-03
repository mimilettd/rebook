require 'rails_helper'

feature "User can view one book" do
  scenario "by visiting book show page" do
    category = Category.create(name: "Fiction")
    books = create_list(:book, 3, category: category)

    visit book_path(books.first)

    expect(page).to have_content(category.name)
    expect(page).to have_content(books.first.title)
    expect(page).to have_content(books.first.subtitle)
    expect(page).to have_content(books.first.author)
    expect(page).to have_content(books.first.publisher.name)
    expect(page).to have_content(books.first.description)
    expect(page).to have_content(books.first.ISBN)
  end
end
