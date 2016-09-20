FactoryGirl.define do
  factory :review do
    title("Title")
    content("hello world")
    bike
    user
  end
end
