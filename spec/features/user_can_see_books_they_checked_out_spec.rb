require 'rails_helper'

feature "Checkout history" do
  scenario "User can see books they checked out" do
    user = User.create(name: "Mimi Le", email: "mimi@rebook.com", password: "password")
    book = create(:book)

    Loan.create(book_id: book.id, user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit myaccount_path

    click_on 'Checkout history'

    expect(current_path).to eq("/account/checkout_history")
    expect(page).to have_content(book.title)
  end
end
