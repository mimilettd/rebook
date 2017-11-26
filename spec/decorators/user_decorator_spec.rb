require 'rails_helper'

RSpec.describe UserDecorator do
  it 'returns a full address' do
    user = create(:user, street_address: '1313 disneyland dr', city: 'anaheim', state: 'ca', zip: '92802').decorate
    expect(user.full_address).to eq("1313 disneyland dr, anaheim, ca 92802")
  end
end
