class SearchController < ApplicationController
  def index
    raw_title = params["search"].parameterize
    book = Book.find_by(slug: raw_title)
    if book.nil?
      redirect_to root_path
    else
      @book = book
    end
  end
end
