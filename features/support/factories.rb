include MetaProg

FactoryGirl.define do
  factory :book, class: Book do |f|
    initialize_with { new("War and Peace") }
  end
end