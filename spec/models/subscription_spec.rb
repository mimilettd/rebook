require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it ".fetch_customer(user)" do
    user = create(:user, email: "mimilettd@gmail.com")

    subscription = Subscription.fetch_customer(user)
    expect(subscription.billing).to eq("charge_automatically")
    expect(subscription.end_period).to eq("December  7, 2017")
    expect(subscription.start_period).to eq("November  7, 2017")
  end
end
