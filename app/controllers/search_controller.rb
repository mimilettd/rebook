class SearchController < ApplicationController
  def index
    @search_term = params["search"]
    @search_results = Book.search_by_title(params["search"])
  end
end
