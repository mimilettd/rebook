require 'rails_helper'

describe "Subscription" do
  it "exists" do
    valid_attributes =
      {
      "id"=>"sub_Bj8XUDK4QcJNRY",
       "object"=>"subscription",
       "application_fee_percent"=>nil,
       "billing"=>"charge_automatically",
       "cancel_at_period_end"=>false,
       "canceled_at"=>nil,
       "created"=>1510096432,
       "current_period_end"=>1512688432,
       "current_period_start"=>1510096432,
       "customer"=>"cus_Bj8XTAABHmSiAr",
       "discount"=>nil,
       "ended_at"=>nil
    }

    subscription = Subscription.new(valid_attributes)
    expect(subscription.billing).to eq("charge_automatically")
    expect(subscription.current_period_start).to eq(1510096432)
    expect(subscription.current_period_end).to eq(1512688432)
  end
end
