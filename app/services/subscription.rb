class Subscription
  attr_reader :id, :billing, :start_period, :end_period
  def initialize(attrs = {})
    @id = attrs["customer"]
    @billing = attrs["billing"]
    @start_period = Time.at(attrs["current_period_start"]).strftime("%B %e, %Y")
    @end_period = Time.at(attrs["current_period_end"]).strftime("%B %e, %Y")
  end

  def self.fetch_customer(user)
    customer = StripeService.fetch_customer(user)
    Subscription.new(customer)
  end
end
