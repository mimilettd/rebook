require 'rails_helper'

describe "StripeService" do
  it ".fetch_customer" do
    user = User.create(name: "Mimi Le", email: "mimilettd@gmail.com", password: "password")

    raw_data = StripeService.fetch_customer(user)

    expect(raw_data).to be_a(Hash)
  end
end
