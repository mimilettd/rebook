require 'rails_helper'

RSpec.describe Loan, type: :model do
  it ".book_title" do
    book = create(:book)
    user = create(:user)
    loan = Loan.create(book_id: book.id, user_id: user.id)

    book_title = loan.book_title
    expect(book_title).to eq(book.title)
  end

  it ".status" do
    book = create(:book)
    user = create(:user)
    loan = Loan.create(book_id: book.id, user_id: user.id)

    expect(loan.status).to eq("Checked out")
  end
end
