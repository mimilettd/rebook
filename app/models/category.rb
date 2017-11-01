class Category < ApplicationRecord
  validates_presence_of :name, uniqueness: true
end
