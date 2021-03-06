class Book < ApplicationRecord
  belongs_to :category
  belongs_to :publisher
  has_many :loans
  has_many :users, through: :loans
  validates_presence_of :title, :author, :description, :ISBN, :image_url
  validates :slug, uniqueness: true

  before_validation :generate_slug

  include PgSearch
  pg_search_scope :search_by_title, :against => :title

  def generate_slug
    self.slug = title.parameterize
  end

  def average_rating
    ReviewsWidget.fetch_average_rating(self.ISBN)
  end

  def self.recently_checked_out
    joins(:loans).order(created_at: :desc).limit(3)
  end
end
