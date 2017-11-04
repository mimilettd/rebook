class BooksController < ApplicationController
  def show
    @book = Book.find(params["id"])
    @review_widget = ReviewsWidget.fetch_reviews(@book.ISBN)
    @average_rating = ReviewsWidget.fetch_average_rating(@book.ISBN)
  end
end
