require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new }

  it "is valid with valid attributes" do
    subject.name = "Mimi Le"
    subject.email = "mimi@rebook.com"
    subject.password = "password"

    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.email = "mimi@rebook.com"
    subject.password = "password"

    expect(subject).to_not be_valid
  end

  it "is not valid without a email" do
    subject.name = "Mimi Le"
    subject.password = "password"

    expect(subject).to_not be_valid
  end

  it "is not valid without a password" do
    subject.name = "Mimi Le"
    subject.email = "mimi@rebook.com"

    expect(subject).to_not be_valid
  end
end
