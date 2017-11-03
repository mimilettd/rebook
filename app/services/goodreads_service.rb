class GoodreadsService
  def initialize
    @conn = Faraday.new(:url => 'https://www.goodreads.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def fetch_average_rating(isbn)
    response = conn.get "/book/review_counts.json?isbns=#{isbn}&key=#{ENV['GOODREADS_CLIENT_ID']}"
  end

  def self.fetch_average_rating(isbn)
    new.fetch_average_rating(isbn)
  end

  private
  attr_reader :conn
end
