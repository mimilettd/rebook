class Category < ApplicationRecord
  validates_presence_of :name, uniqueness: true
  validates :slug, uniqueness: true

  has_many :books

  before_validation :generate_slug

  def generate_slug
    self.slug = name.parameterize
  end
end
