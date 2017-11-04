class ReviewsWidget
  def self.fetch_reviews(isbn)
    GoodreadsService.fetch_reviews(isbn)
  end

  def self.fetch_average_rating(isbn)
    GoodreadsService.fetch_average_rating(isbn)
  end
end
