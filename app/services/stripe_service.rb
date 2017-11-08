class StripeService
  def initialize
    @conn = Faraday.new(:url => 'https://api.stripe.com') do |faraday|
      faraday.authorization :Bearer, ENV['STRIPE_SECRET_KEY']
      faraday.adapter  Faraday.default_adapter
    end
  end

  def fetch_customer(user)
    response = conn.get "/v1/search?query=#{user.email}"
    JSON.parse(response.body)["data"][0]["subscriptions"]["data"][0]
  end

  def self.fetch_customer(user)
    new.fetch_customer(user)
  end

  private
  attr_reader :conn
end
