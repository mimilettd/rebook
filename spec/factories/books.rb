FactoryBot.define do
  factory :book do
    association :category
    association :publisher
    sequence :title do |n|
      "Book#{n}"
    end
    subtitle "MyString"
    author "MyString"
    description "MyString"
    image_url "https://prodimage.images-bn.com/pimages/9780151010264_p0_v3_s550x406.jpg"
    ISBN "MyString"
  end
end
