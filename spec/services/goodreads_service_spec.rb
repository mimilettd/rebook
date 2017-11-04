require 'rails_helper'

describe "GoodreadsService" do
  it ".fetch_reviews(isbn)" do
    raw_data = GoodreadsService.fetch_reviews("9781419725456")

    expect(raw_data.count).to eq(1)
  end

  it ".fetch_average_rating(isbn)" do
    raw_data = GoodreadsService.fetch_average_rating("9781419725456")

    expect(raw_data.count).to eq(1)
  end
end
