require 'rails_helper'

feature "User can view one book" do
  scenario "by visiting book show page" do

   book = Book.create(category: Category.find_or_create_by(name: "Classics"), publisher: Publisher.find_or_create_by(name: "New American Library"), title: "1984", author: "George Orwell", description: "The year 1984 has come and gone, but George Orwell's prophetic, nightmarish vision in 1949 of the world we were becoming is timelier than ever. 1984 is still the great modern classic of negative utopia -a startlingly original and haunting novel that creates an imaginary world that is completely convincing, from the first sentence to the last four words. No one can deny the novel's hold on the imaginations of whole generations, or the power of its admonitions -a power that seems to grow, not lessen, with the passage of time.", ISBN: "9780451524935", image_url: "https://prodimage.images-bn.com/pimages/9780451524935_p0_v2_s550x406.jpg")

    visit book_path(book)

    expect(page).to have_content(book.category.name)
    expect(page).to have_content(book.title)
    expect(page).to have_content(book.subtitle)
    expect(page).to have_content(book.author)
    expect(page).to have_content(book.publisher.name)
    expect(page).to have_content(book.description)
    expect(page).to have_content(book.ISBN)
  end
end
