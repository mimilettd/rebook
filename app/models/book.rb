class Book < ApplicationRecord
  belongs_to :category
  belongs_to :publisher
  validates_presence_of :title, :author, :description, :ISBN, :image_url
  validates :slug, uniqueness: true

  before_validation :generate_slug

  def generate_slug
    self.slug = title.parameterize
  end
end
