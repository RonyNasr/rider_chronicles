FactoryGirl.define do
  factory :bike do
    make("BMW")
    imageURL('url')
    user
  end
end
