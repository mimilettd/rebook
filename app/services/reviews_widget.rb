class ReviewsWidget
  def self.fetch_reviews(isbn)
    GoodreadsService.fetch_reviews(isbn)
  end
end
