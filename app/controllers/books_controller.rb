class BooksController < ApplicationController
  def show
    @book = Book.find(params["id"])
    @review_widget = ReviewsWidget.fetch_reviews(@book.ISBN)
  end
end
