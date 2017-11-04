class GoodreadsService
  def initialize
    @conn = Faraday.new(:url => 'https://www.goodreads.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def fetch_average_rating(isbn)
    response = conn.get "/book/review_counts.json?isbns=#{isbn}&key=#{ENV['GOODREADS_CLIENT_ID']}"
    JSON.parse(response.body)["books"][0]["average_rating"]
  end

  def self.fetch_average_rating(isbn)
    new.fetch_average_rating(isbn)
  end

  def fetch_reviews(isbn)
    response = conn.get "https://www.goodreads.com/book/isbn/#{isbn}?format=json&key=#{ENV['GOODREADS_CLIENT_ID']}"
    JSON.parse(response.body)["reviews_widget"]
  end

  def self.fetch_reviews(isbn)
    new.fetch_reviews(isbn)
  end

  private
  attr_reader :conn
end
