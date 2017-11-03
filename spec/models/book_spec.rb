require 'rails_helper'

RSpec.describe Book, type: :model do
  subject { create(:book) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a category" do
    subject.category_id = nil

    expect(subject).to_not be_valid
  end

  it "is not valid without a publisher" do
    subject.publisher_id = nil

    expect(subject).to_not be_valid
  end

  it "is valid without a subtitle" do
    subject.subtitle = nil

    expect(subject).to be_valid
  end

  it "is not valid without an author" do
    subject.author = nil

    expect(subject).to_not be_valid
  end

  it "is not valid without a description" do
    subject.description = nil

    expect(subject).to_not be_valid
  end

  it "is not valid without an ISBN" do
    subject.ISBN = nil

    expect(subject).to_not be_valid
  end

  it "is not valid without an image url" do
    subject.image_url = nil

    expect(subject).to_not be_valid
  end
end
