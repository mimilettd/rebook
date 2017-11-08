require 'rails_helper'

RSpec.describe LoanDecorator do
  it 'returns the checkout date' do
    book = create(:book)
    user = create(:user)
    loan = Loan.create(book_id: book.id, user_id: user.id).decorate
    expect(loan.checkout_date).to eq('11-08-17')
  end
end
