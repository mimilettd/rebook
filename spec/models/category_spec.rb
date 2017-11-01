require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { Category.new }

  it "is valid with valid attributes" do
    subject.name = "Nonfiction"

    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil

    expect(subject).to_not be_valid
  end

  it "is not valid if there is an existing name" do
    subject.name = "Nonfiction"

    expect(subject).to be_valid
  end
end
