require 'rails_helper'

RSpec.describe UserDecorator do
  it 'returns a full address' do
    user = create(:user, street_address: '1313 disneyland dr', city: 'anaheim', state: 'ca', zip: '92802').decorate
    expect(user.full_address).to eq("1313 disneyland dr, anaheim, ca 92802")
  end

  it 'returns a created at' do
    user = create(:user).decorate
    expect(user.created_at).to eq('11-08-2017')
  end

  it "returns a trial expiration date" do
    user = create(:user).decorate
    expect(user.trial_expiration).to eq("12-08-2017")
  end
end
