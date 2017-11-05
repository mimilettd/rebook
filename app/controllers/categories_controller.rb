class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order(:name)
  end

  def show
    @category = Category.find_by(slug: params["slug"] ||= params["id"])
    if @category.nil?
      @category = Category.find(params["id"])
    end
    @books = @category.books.order(:title)
  end
end
