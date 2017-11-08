class Subscription
  attr_reader :customer, :billing, :current_period_start, :current_period_end
  def initialize(attrs = {})
    @customer = attrs["customer"]
    @billing = attrs["billing"]
    @current_period_start = attrs["current_period_start"]
    @current_period_end = attrs["current_period_end"]
  end

  def self.fetch_customer(user)
    customer = StripeService.fetch_customer(user)
    Subscription.new(customer)
  end
end
