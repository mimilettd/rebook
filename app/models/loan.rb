class Loan < ApplicationRecord
  has_many :books
  has_many :users

  enum return_status: { false: 0, true: 1 }
end
