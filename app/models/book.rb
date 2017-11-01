class Book < ApplicationRecord
  belongs_to :category
  belongs_to :publisher
  validates_presence_of :title, :author, :description, :ISBN, :image_url
end
