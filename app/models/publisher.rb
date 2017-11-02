class Publisher < ApplicationRecord
  validates_presence_of :name, uniqueness: true
  has_many :books
end
