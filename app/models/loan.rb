class Loan < ApplicationRecord
  has_many :books
  has_many :users

  enum return_status: { checked_out: 0, returned: 1 }

  def book_title
    Book.find(self.book_id).title
  end

  def status
    if self.return_status == "checked_out"
      "Checked out"
    else
      "Returned"
    end
  end
end
